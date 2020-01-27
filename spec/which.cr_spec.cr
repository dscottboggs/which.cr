require "./spec_helper"

def which_executable_finds(command : String, at location : String)
  which_executable_finds command, at: Path.new location
end

def which_executable_finds(command : String, at location : Path)
  it %<finds "#{command}"> do
    Which.executable(command).should eq location
  end
end

def test_which(name, is path : String)
  test_which name, is: Path.new path
end

def test_which(name, is path : Path)
  it %<finds "#{name}"> do
    which(name).should eq path
  end
end

describe Which do
  describe ".executable" do
    which_executable_finds "true", at: "/usr/bin/true"
    which_executable_finds "sh", at: "/usr/bin/sh"
    which_executable_finds "crystal", at: "/usr/bin/crystal"
    it "throws an exception when given a fake command" do
      expect_raises Which::ExecutableNotFound do
        Which.executable "not-a-real-command"
      end
    end
  end
end

describe ".which" do
  test_which "true", is: "/usr/bin/true"
  test_which "bash", is: "/usr/bin/bash"
  it "throws an exception when given a fake command" do
    expect_raises Which::ExecutableNotFound do
      which "fake-command"
    end
  end
end
