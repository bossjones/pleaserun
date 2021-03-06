require "pleaserun/platform/base"
require "pleaserun/namespace"

# The System V-style init system implementation.
#
# This will generate the familiar /etc/init.d/ scripts.
class PleaseRun::Platform::SYSV < PleaseRun::Platform::Base
  def files
    return Enumerator::Generator.new do |out|
      out.yield(safe_filename("/etc/init.d/{{ name }}"), render_template("init.sh"), 0755)
      out.yield(safe_filename("/etc/default/{{ name }}"), render_template("default"))
    end
  end
end
