mkdir -p /srv/preware/build/nizovn_apps
cp -Rf packages/* /srv/preware/build/nizovn_apps
mkdir -p ipkgs
for dir in /srv/preware/build/nizovn_apps/*/
do
	if [ -f $dir/Makefile ]; then
		make -C $dir
		cp $dir/ipkgs/*.ipk ipkgs/
	fi
done
cp -l IpkgFeedGenerator.jar ipkgs/
cd ipkgs
java -jar IpkgFeedGenerator.jar
