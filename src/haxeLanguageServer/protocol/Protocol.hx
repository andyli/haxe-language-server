package haxeLanguageServer.protocol;

import jsonrpc.Types;

@:publicFields
class Methods {
	/**
		The initialize request is sent from the client to Haxe to determine the capabilities.
	**/
	static inline var Initialize = new HaxeRequestMethod<InitializeParams, InitializeResult>("initialize");
}

/* Initialize */
typedef InitializeParams = {
	final ?supportsResolve:Bool;

	/** dot paths to exclude from readClassPaths / toplevel completion **/
	final ?exclude:Array<String>;
}

/**
	Represents a semantic version, see https://semver.org/.
**/
typedef Version = {
	final major:Int;
	final minor:Int;
	final patch:Int;
	final pre:String;
	final build:String;
}

typedef InitializeResult = Response<{
	final protocolVersion:Version;
	final haxeVersion:Version;
	final methods:Array<String>;
}>;

/* general protocol types */
typedef Timer = {
	final name:String;
	final time:Float;
	final ?path:String;
	final ?info:String;
	final ?calls:Int;
	final ?percentTotal:Float;
	final ?percentParent:Float;
	final ?children:Array<Timer>;
}

typedef Response<T> = {
	final ?result:T;

	/** UNIX timestamp at the moment the data was sent. **/
	final ?timestamp:Float;

	/** Only sent if `--times` is enabled. **/
	final ?timers:Timer;
}

typedef FileParams = {
	var file:FsPath;
}

typedef HaxeRequestMethod<TParams, TResponse> = RequestMethod<TParams, TResponse, ResponseErrorData>;
typedef HaxeNotificationMethod<TParams> = NotificationMethod<TParams>;

typedef HaxeResponseErrorData = Array<{
	var severity:HaxeResponseErrorSeverity;
	var ?location:Location;
	var message:String;
}>;

enum abstract HaxeResponseErrorSeverity(Int) {
	var Error = 1;
	var Warning;
	var Hint;
}
