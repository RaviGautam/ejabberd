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


## Setup Ejabberd for mysql :
cd ejabberd <br/>
./autogen.sh <br/>
./configure --enable-user=root --enable-mysql --enable-new-sql-schema --prefix=/opt/ejabberd_mysql <br/>

## Make project 
make  && make rel
