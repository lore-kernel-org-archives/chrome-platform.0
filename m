Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A07A
	for <chrome-platform@lists.linux.dev>; Mon, 11 Jul 2022 13:51:10 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BBf38I026647;
	Mon, 11 Jul 2022 08:38:16 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bhuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 08:38:15 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26BCcEaW000398
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 11 Jul 2022 08:38:14 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 11 Jul
 2022 08:38:13 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:38:13 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVE5011687;
	Mon, 11 Jul 2022 08:37:33 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
        <linux-mips@vger.kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC: Andy Gross <agross@kernel.org>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Benson Leung <bleung@chromium.org>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Zhang
 Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Eugen
 Hristev <eugen.hristev@microchip.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benjamin Fair
	<benjaminfair@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Avi Fishman
	<avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Thara Gopinath
	<thara.gopinath@linaro.org>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Fabio
 Estevam <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Haibo Chen <haibo.chen@nxp.com>,
        Arnd
 Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Patrick
 Venture <venture@google.com>,
        Amit Kucheria <amitk@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Guenter
 Roeck <groeck@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/15] make iio inkern interface firmware agnostic
Date: Mon, 11 Jul 2022 14:38:20 +0200
Message-ID: <20220711123835.811358-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WcE9hls-TN6poatnPpXjvAc08Rg5Ey-4
X-Proofpoint-GUID: WcE9hls-TN6poatnPpXjvAc08Rg5Ey-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=921 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110054

First version of the series can be found here:=0D
=0D
https://lore.kernel.org/linux-iio/20220610084545.547700-1-nuno.sa@analog.co=
m/=0D
=0D
v2 changes:=0D
=0D
[1/15]=0D
  * Fix typo and added more description in the commit message.=0D
=0D
[3/15]=0D
  * Remove superfluous code;=0D
  * Commit message spell fixes and added more details;=0D
  * Improved error handling (this is the most significant change in this=0D
version. More details on the commit message).=0D
=0D
[4/15]=0D
  * Drop the 'ugly' parent_lookup flag. With the new error handling,=0D
    we can use -ENODEV to infer if we should proceed or not with the=0D
    lookup.=0D
=0D
[5/15]:=0D
  * Moved some local declarations up so long lines first;=0D
  * Use 'bus_find_device_by_fwnode()';=0D
  * Proper ordering in includes.=0D
  * Adapted error handling in '__fwnode_iio_channel_get_by_name()' taking=0D
ACPI into account and when 'name' is given but index < 0. It seems that=0D
ACPI code can actually return -ENOENT with index < 0 for which case we=0D
should continue the search. Not sure if a check  in ACPI ('if (index < 0)=0D
return -EINVAL;) like is done in OF would make sense...=0D
=0D
[12/15]:=0D
  * Use 'device_property_count_u64()' to get the number of diff channels.=0D
So no need for 'magic' divisions by 2 (no idea why I haven't done like=0D
this in the first place).=0D
=0D
[15/15]=0D
  * Fix wrong conversion of 'if (ptr !=3D NULL)' to 'if (!ptr)'.=0D
=0D
Special note for patch 3/15 where -ENODEV is still used despite some talks=
=0D
about using -ENOENT and hence, be more in line with firmware code. The=0D
reason I kept it was to be consistent with the rest of the file. I'd say=0D
that if we want to move to -ENOENT we should do it in a separate patch=0D
and for the complete file.=0D
=0D
Nuno S=C3=A1 (15):=0D
  iio: inkern: only release the device node when done with it=0D
  iio: inkern: fix return value in devm_of_iio_channel_get_by_name()=0D
  iio: inkern: only return error codes in iio_channel_get_*() APIs=0D
  iio: inkern: split of_iio_channel_get_by_name()=0D
  iio: inkern: move to fwnode properties=0D
  thermal: qcom: qcom-spmi-adc-tm5: convert to IIO fwnode API=0D
  iio: adc: ingenic-adc: convert to IIO fwnode interface=0D
  iio: adc: ab8500-gpadc: convert to device properties=0D
  iio: adc: at91-sama5d2_adc: convert to device properties=0D
  iio: adc: qcom-pm8xxx-xoadc: convert to device properties=0D
  iio: adc: qcom-spmi-vadc: convert to device properties=0D
  iio: adc: qcom-spmi-adc5: convert to device properties=0D
  iio: adc: stm32-adc: convert to device properties=0D
  iio: inkern: remove OF dependencies=0D
  iio: inkern: fix coding style warnings=0D
=0D
 drivers/iio/adc/ab8500-gpadc.c           |  27 +--=0D
 drivers/iio/adc/at91-sama5d2_adc.c       |  30 +--=0D
 drivers/iio/adc/ingenic-adc.c            |   8 +-=0D
 drivers/iio/adc/qcom-pm8xxx-xoadc.c      |  58 +++--=0D
 drivers/iio/adc/qcom-spmi-adc5.c         |  63 +++---=0D
 drivers/iio/adc/qcom-spmi-vadc.c         |  44 ++--=0D
 drivers/iio/adc/stm32-adc.c              | 121 +++++-----=0D
 drivers/iio/inkern.c                     | 271 +++++++++++++----------=0D
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c |   3 +-=0D
 include/linux/iio/consumer.h             |  28 +--=0D
 include/linux/iio/iio.h                  |   8 +-=0D
 11 files changed, 347 insertions(+), 314 deletions(-)=0D
=0D
-- =0D
2.37.0=0D
=0D
