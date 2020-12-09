default: kill generate open

kill:
	@pkill -f '/Applications/Xcode(-beta)?.app/Contents/MacOS/Xcode' || true

generate:
	@tuist generate

open:
	@xed .
