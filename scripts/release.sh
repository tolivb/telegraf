#!/bin/sh

if git describe --exact-match HEAD 2>&1 >/dev/null; then
    ./scripts/build.py --release --package --platform=all --arch=all \
    	--upload --bucket=dl.influxdata.com/telegraf/releases
elif [ "${CIRCLE_STAGE}" = nightly ]; then
	./scripts/build.py --nightly --package --platform=all --arch=all \
		--upload --bucket=dl.influxdata.com/telegraf/nightlies
else
	./scripts/build.py --package --platform=all --arch=all
fi

mv build artifacts
