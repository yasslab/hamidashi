もし(/^(.*)コマンドを実行する$/) do |command|
  @command_result = `#{command}`
  @command_status = $?
end

ならば(/^コマンドの実行結果は以下の通りである$/) do |result|
  @command_result == result
end

ならば(/^コマンドの終了ステータスは(\d+)である$/) do |status|
  @command_status.exitstatus == status
end
