# A simple Crystal library for locating the absolute path of a file along
# the $PATH environment variable's various paths.
module Which
  extend self

  PATHTEXT = ENV["PATH"]

  # Array(Path) representing the paths found in the $PATH environment variable
  PATH = PATHTEXT.split(':').map &->Path.new(String)

  def executable?(name : Path | String) : Path?
    if path = PATH.find { |path| File.executable?(path / name) }
      path / name
    end
  end

  def executable(name : Path | String) : Path
    executable?(name) || raise ExecutableNotFound.new name
  end

  class ExecutableNotFound < Exception
    property command : Path | String

    def initialize(@command)
      super "no executable found with name #{@command} on $PATH=#{PATHTEXT}"
    end
  end
end

# Returns a Path representing the absolute path of the given command, or `nil`
# if it wasn't found in any of the directories in the $PATH enviroment variable.
def which?(command : Path | String) : Path?
  Which.executable? command
end

# Returns a Path representing the absolute path of the given command, or raises
# a `Which::ExecutableNotFound` if it wasn't found in any of the directories in
# the $PATH enviroment variable.
def which(command : Path | String) : Path
  Which.executable command
end
