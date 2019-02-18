package haxeLanguageServer.helper;

import jsonrpc.Types.NoData;
import jsonrpc.ResponseError;

class ResponseErrorHelper {
	public static function handler(reject:ResponseError<NoData>->Void) {
		return function(error:String) reject(ResponseError.internalError(error));
	}

	public static function invalidXml(reject:ResponseError<NoData>->Void, data:String) {
		reject(ResponseError.internalError("Invalid xml data: " + data));
	}
}
