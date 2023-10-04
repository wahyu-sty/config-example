
deps:
	helm package charts/webapp -d charts/inalix/charts/
	helm package charts/worker -d charts/inalix/charts/
	helm package charts/daphne -d charts/inalix/charts/

package:
	helm package charts/inalix -d repo/
	helm package charts/webapp -d repo/
	helm package charts/worker -d repo/
	helm package charts/daphne -d repo/

	helm repo index repo/

upload:
	rsync repo/* inalix_site@inalix.com:charts.inalix.com/

all: package upload
