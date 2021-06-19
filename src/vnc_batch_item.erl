%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(vnc_batch_item).

-compile(export_all).

do_decode(<<"result">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_vnc_batch_item(<<"jabber:client">>, Opts, El);
do_decode(<<"result">>, <<"jabber:server">>, El,
	  Opts) ->
    decode_vnc_batch_item(<<"jabber:server">>, Opts, El);
do_decode(<<"result">>, <<"jabber:component:accept">>,
	  El, Opts) ->
    decode_vnc_batch_item(<<"jabber:component:accept">>,
			  Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"result">>, <<"jabber:client">>},
     {<<"result">>, <<"jabber:server">>},
     {<<"result">>, <<"jabber:component:accept">>}].

do_encode({result_vnc, _, _} = Result, TopXMLNS) ->
    encode_vnc_batch_item(Result, TopXMLNS).

do_get_name({result_vnc, _, _}) -> <<"result">>.

do_get_ns({result_vnc, _, _}) -> <<"jabber:client">>.

pp(result_vnc, 2) -> [seconds, jid];
pp(_, _) -> no.

records() -> [{result_vnc, 2}].

dec_int(Val, Min, Max) ->
    case erlang:binary_to_integer(Val) of
      Int when Int =< Max, Min == infinity -> Int;
      Int when Int =< Max, Int >= Min -> Int
    end.

enc_int(Int) -> erlang:integer_to_binary(Int).

decode_vnc_batch_item(__TopXMLNS, __Opts,
		      {xmlel, <<"result">>, _attrs, _els}) ->
    {Seconds, Jid} = decode_vnc_batch_item_attrs(__TopXMLNS,
						 _attrs, undefined, undefined),
    {result_vnc, Seconds, Jid}.

decode_vnc_batch_item_attrs(__TopXMLNS,
			    [{<<"seconds">>, _val} | _attrs], _Seconds, Jid) ->
    decode_vnc_batch_item_attrs(__TopXMLNS, _attrs, _val,
				Jid);
decode_vnc_batch_item_attrs(__TopXMLNS,
			    [{<<"jid">>, _val} | _attrs], Seconds, _Jid) ->
    decode_vnc_batch_item_attrs(__TopXMLNS, _attrs, Seconds,
				_val);
decode_vnc_batch_item_attrs(__TopXMLNS, [_ | _attrs],
			    Seconds, Jid) ->
    decode_vnc_batch_item_attrs(__TopXMLNS, _attrs, Seconds,
				Jid);
decode_vnc_batch_item_attrs(__TopXMLNS, [], Seconds,
			    Jid) ->
    {decode_vnc_batch_item_attr_seconds(__TopXMLNS,
					Seconds),
     decode_vnc_batch_item_attr_jid(__TopXMLNS, Jid)}.

encode_vnc_batch_item({result_vnc, Seconds, Jid},
		      __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = [],
    _attrs = encode_vnc_batch_item_attr_jid(Jid,
					    encode_vnc_batch_item_attr_seconds(Seconds,
									       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													  __TopXMLNS))),
    {xmlel, <<"result">>, _attrs, _els}.

decode_vnc_batch_item_attr_seconds(__TopXMLNS,
				   undefined) ->
    undefined;
decode_vnc_batch_item_attr_seconds(__TopXMLNS, _val) ->
    case catch dec_int(_val, 0, infinity) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"seconds">>, <<"result">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_vnc_batch_item_attr_seconds(undefined, _acc) ->
    _acc;
encode_vnc_batch_item_attr_seconds(_val, _acc) ->
    [{<<"seconds">>, enc_int(_val)} | _acc].

decode_vnc_batch_item_attr_jid(__TopXMLNS, undefined) ->
    undefined;
decode_vnc_batch_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"jid">>, <<"result">>, __TopXMLNS}});
      _res -> _res
    end.

encode_vnc_batch_item_attr_jid(undefined, _acc) -> _acc;
encode_vnc_batch_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].
