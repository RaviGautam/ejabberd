%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(vnc_batch_jid).

-compile(export_all).

do_decode(<<"jid">>, <<"jabber:client">>, El, Opts) ->
    decode_vnc_batch_jid(<<"jabber:client">>, Opts, El);
do_decode(<<"jid">>, <<"jabber:server">>, El, Opts) ->
    decode_vnc_batch_jid(<<"jabber:server">>, Opts, El);
do_decode(<<"jid">>, <<"jabber:component:accept">>, El,
	  Opts) ->
    decode_vnc_batch_jid(<<"jabber:component:accept">>,
			 Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"jid">>, <<"jabber:client">>},
     {<<"jid">>, <<"jabber:server">>},
     {<<"jid">>, <<"jabber:component:accept">>}].

pp(_, _) -> no.

records() -> [].

decode_vnc_batch_jid(__TopXMLNS, __Opts,
		     {xmlel, <<"jid">>, _attrs, _els}) ->
    Cdata = decode_vnc_batch_jid_els(__TopXMLNS, __Opts,
				     _els, <<>>),
    Cdata.

decode_vnc_batch_jid_els(__TopXMLNS, __Opts, [],
			 Cdata) ->
    decode_vnc_batch_jid_cdata(__TopXMLNS, Cdata);
decode_vnc_batch_jid_els(__TopXMLNS, __Opts,
			 [{xmlcdata, _data} | _els], Cdata) ->
    decode_vnc_batch_jid_els(__TopXMLNS, __Opts, _els,
			     <<Cdata/binary, _data/binary>>);
decode_vnc_batch_jid_els(__TopXMLNS, __Opts, [_ | _els],
			 Cdata) ->
    decode_vnc_batch_jid_els(__TopXMLNS, __Opts, _els,
			     Cdata).

encode_vnc_batch_jid(Cdata, __TopXMLNS) ->
    __NewTopXMLNS = xmpp_codec:choose_top_xmlns(<<>>,
						[<<"jabber:client">>,
						 <<"jabber:server">>,
						 <<"jabber:component:accept">>],
						__TopXMLNS),
    _els = encode_vnc_batch_jid_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"jid">>, _attrs, _els}.

decode_vnc_batch_jid_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"jid">>, __TopXMLNS}});
decode_vnc_batch_jid_cdata(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_cdata_value, <<>>, <<"jid">>, __TopXMLNS}});
      _res -> _res
    end.

encode_vnc_batch_jid_cdata(_val, _acc) ->
    [{xmlcdata, jid:encode(_val)} | _acc].
