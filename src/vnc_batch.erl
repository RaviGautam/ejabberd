%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(vnc_batch).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:batch">>, El,
	  Opts) ->
    decode_last_batch(<<"jabber:iq:batch">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:iq:batch">>}].

do_encode({last_batch, _, _} = Query, TopXMLNS) ->
    encode_last_batch(Query, TopXMLNS).

do_get_name({last_batch, _, _}) -> <<"query">>.

do_get_ns({last_batch, _, _}) -> <<"jabber:iq:batch">>.

pp(last_batch, 2) -> [vnc_batch_item, vnc_batch_jid];
pp(_, _) -> no.

records() -> [{last_batch, 2}].

decode_last_batch(__TopXMLNS, __Opts,
		  {xmlel, <<"query">>, _attrs, _els}) ->
    {Vnc_batch_jid, Vnc_batch_item} =
	decode_last_batch_els(__TopXMLNS, __Opts, _els, [], []),
    {last_batch, Vnc_batch_item, Vnc_batch_jid}.

decode_last_batch_els(__TopXMLNS, __Opts, [],
		      Vnc_batch_jid, Vnc_batch_item) ->
    {lists:reverse(Vnc_batch_jid),
     lists:reverse(Vnc_batch_item)};
decode_last_batch_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"result">>, _attrs, _} = _el | _els],
		      Vnc_batch_jid, Vnc_batch_item) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				Vnc_batch_jid,
				[vnc_batch_item:decode_vnc_batch_item(<<"jabber:client">>,
								      __Opts,
								      _el)
				 | Vnc_batch_item]);
      <<"jabber:server">> ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				Vnc_batch_jid,
				[vnc_batch_item:decode_vnc_batch_item(<<"jabber:server">>,
								      __Opts,
								      _el)
				 | Vnc_batch_item]);
      <<"jabber:component:accept">> ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				Vnc_batch_jid,
				[vnc_batch_item:decode_vnc_batch_item(<<"jabber:component:accept">>,
								      __Opts,
								      _el)
				 | Vnc_batch_item]);
      _ ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				Vnc_batch_jid, Vnc_batch_item)
    end;
decode_last_batch_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"jid">>, _attrs, _} = _el | _els],
		      Vnc_batch_jid, Vnc_batch_item) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:client">> ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				[vnc_batch_jid:decode_vnc_batch_jid(<<"jabber:client">>,
								    __Opts, _el)
				 | Vnc_batch_jid],
				Vnc_batch_item);
      <<"jabber:server">> ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				[vnc_batch_jid:decode_vnc_batch_jid(<<"jabber:server">>,
								    __Opts, _el)
				 | Vnc_batch_jid],
				Vnc_batch_item);
      <<"jabber:component:accept">> ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				[vnc_batch_jid:decode_vnc_batch_jid(<<"jabber:component:accept">>,
								    __Opts, _el)
				 | Vnc_batch_jid],
				Vnc_batch_item);
      _ ->
	  decode_last_batch_els(__TopXMLNS, __Opts, _els,
				Vnc_batch_jid, Vnc_batch_item)
    end;
decode_last_batch_els(__TopXMLNS, __Opts, [_ | _els],
		      Vnc_batch_jid, Vnc_batch_item) ->
    decode_last_batch_els(__TopXMLNS, __Opts, _els,
			  Vnc_batch_jid, Vnc_batch_item).

encode_last_batch({last_batch, Vnc_batch_item,
		   Vnc_batch_jid},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:batch">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_last_batch_$vnc_batch_jid'(Vnc_batch_jid,
							 __NewTopXMLNS,
							 'encode_last_batch_$vnc_batch_item'(Vnc_batch_item,
											     __NewTopXMLNS,
											     []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_last_batch_$vnc_batch_jid'([], __TopXMLNS,
				   _acc) ->
    _acc;
'encode_last_batch_$vnc_batch_jid'([Vnc_batch_jid
				    | _els],
				   __TopXMLNS, _acc) ->
    'encode_last_batch_$vnc_batch_jid'(_els, __TopXMLNS,
				       [vnc_batch_jid:encode_vnc_batch_jid(Vnc_batch_jid,
									   __TopXMLNS)
					| _acc]).

'encode_last_batch_$vnc_batch_item'([], __TopXMLNS,
				    _acc) ->
    _acc;
'encode_last_batch_$vnc_batch_item'([Vnc_batch_item
				     | _els],
				    __TopXMLNS, _acc) ->
    'encode_last_batch_$vnc_batch_item'(_els, __TopXMLNS,
					[vnc_batch_item:encode_vnc_batch_item(Vnc_batch_item,
									      __TopXMLNS)
					 | _acc]).
