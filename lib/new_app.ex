defmodule NewApp do
  def start(_types, _args) do
    Task.start(&main/0)
  end

  def main do
    case :os.type() do
      {:win32, _} -> System.cmd("chcp.com", ["65001"])
    end

    write_file()
    read_file()
  end

  @output_dir "_output"

  def write_file do
    File.mkdir_p(@output_dir)
    output_file_path = Path.absname("hello.txt", @output_dir)

    case File.write(output_file_path, "Hello World!", [:utf8]) do
      :ok -> IO.puts("Done!")
      {:error, reason} -> IO.puts(reason)
    end
  end

  def read_file do
    input_file_path = Path.absname("hello.txt", @output_dir)

    with {:ok, result} <- File.read(input_file_path) do
      new_string = result |> to_string

      new_string |> IO.puts()
    else
      {:error, :enoent} -> IO.puts("Enoent!")
    end
  end
end
