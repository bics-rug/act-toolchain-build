#!/bin/bash

echo "#############################"
echo "# copy docs"

mkdir $ACT_HOME/docs
cp docsredirect.html $ACT_HOME/docs/index.html
cd $ACT_HOME/docs

wget  --no-verbose \
      --recursive \
      --level="20" \
      --no-parent \
      --page-requisites \
      --convert-links \
      --adjust-extension \
      --exclude-directories=_detail,_export \
      --reject="feed.php*,*do=backlink.html,*do=edit*,*do=index.html,*indexer.php?id=*,*do=admin.html,*do=revisions.html,*do=media*,*.pdf*,*.tgz*,*taskrunner.php*,*.mp4*" \
      --no-host-directories \
      https://avlsi.csl.yale.edu/act/


