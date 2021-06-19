## Setup Erlang :
wget http://erlang.org/download/otp_src_21.1.tar.gz <br/>
cd otp_src_21.1<br/>
./configure <br/>
make<br/>
make install<br/>

## clone ejabberd
git clone https://github.com/RaviGautam/ejabberd.git <br/>
cd ejabberd<br/>

## Setup Ejabberd for psql :
./autogen.sh<br/>
./configure --enable-user=root --enable-pgsql --enable-new-sql-schema --prefix=/opt/ejabberd_psql <br/>
make <br/>

## Setup Ejabberd for mysql :
./autogen.sh <br/>
./configure --enable-user=root --enable-mysql --enable-new-sql-schema --prefix=/opt/ejabberd_mysql <br/>
make <br/>

## You will get this error 

```
src/mod_last.erl:180: record last_batch undefined
src/mod_last.erl:188: record result_vnc undefined
src/mod_last.erl:191: record result_vnc undefined
src/mod_last.erl:179: Warning: variable 'Res' is unused
```
## make spec
```
cd deps/xmpp
make spec
cd ../..
```

## Make project 
make  && make install

## Request and Response

```
<iq xmlns="jabber:client" 
type="get" id="9ce63b4d-ee3d-48a9-b63d-c82709e44fd6"> 
  <query xmlns="jabber:iq:batch"> 
    <jid xmlns="jabber:client">ravi@localhost</jid> 
    <jid xmlns="jabber:client">ravi_1@localhost</jid> 
    <jid xmlns="jabber:client">ravi_2@localhost</jid>
  </query> 
</iq>

<iq type="result" xml:lang="en" from="ravi@localhost" id="9ce63b4d-ee3d-48a9-b63d-c82709e44fd6" to="ravi@localhost">
<query xmlns="jabber:iq:batch">
<result xmlns="jabber:client" jid="ravi_2@localhost" seconds="17"/>
<result xmlns="jabber:client" jid="ravi_1@localhost" seconds="21"/>
<result xmlns="jabber:client" jid="ravi@localhost" seconds="0"/>
</query>
</iq>
```


