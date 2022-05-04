Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760B629AA
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:56 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAG021058;
	Wed, 4 May 2022 12:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uYui3GUDReHMEoWVOJgVxZHHd2RXTViPFt1wsoGQ19o=;
 b=Re7yfdkslZnIrb1pNPjJSH9s+n+1xHAE9/IXko/1POV1sqG9bXZC9oSNz7m5xAb1is5A
 hRdwJX8OviE5RFZmfnt26trniYExXeqzUmE11e6En+8Em8t8UsagNsL8Q59NTnLeNgc4
 2X15BFHYbkc4UamVDGStWVCKg7ffm+xpMyG4gxEK8biwZ3cHZ9oo87VDIPrUg97kjRGX
 s0oGcn63RQy9ooAb/92UHKrb8If/SEUyVoeiI+6GLbWi8ENdBAEJ77grNJ38u+atL6ft
 pYAxkVB8bNwLrzj5XQMsxZAPswaeQikhbFLw4G9ROaHzPfr908FdSISxkcVpYFxIm83E 2A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 72A2811D1;
	Wed,  4 May 2022 17:09:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <codrin.ciubotariu@microchip.com>,
        <lars@metafoo.de>, <cychiang@chromium.org>, <tzungbi@google.com>,
        <bleung@chromium.org>, <matthias.bgg@gmail.com>,
        <kmarinushkin@birdec.com>, <oder_chiou@realtek.com>,
        <steven.eckhoff.opensource@gmail.com>,
        <srinivas.kandagatla@linaro.org>, <alexandre.belloni@bootlin.com>,
        <kuninori.morimoto.gx@renesas.com>, <jiaxin.yu@mediatek.com>,
        <alsa-devel@alsa-project.org>, <chrome-platform@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 22/38] ASoC: rt1019: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:49 +0100
Message-ID: <20220504170905.332415-23-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SkOcWsdXVRIzmtixodHsTRnGBSLVo9f5
X-Proofpoint-GUID: SkOcWsdXVRIzmtixodHsTRnGBSLVo9f5
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1019.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index d45d14fe5c427..f3f15fbe85d0e 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -515,7 +515,7 @@ static struct snd_soc_dai_driver rt1019_dai[] = {
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
-	.probe = rt1019_probe,
+	.probe			= rt1019_probe,
 	.controls		= rt1019_snd_controls,
 	.num_controls		= ARRAY_SIZE(rt1019_snd_controls),
 	.dapm_widgets		= rt1019_dapm_widgets,
@@ -523,6 +523,7 @@ static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
 	.dapm_routes		= rt1019_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(rt1019_dapm_routes),
 	.non_legacy_dai_naming	= 1,
+	.endianness		= 1,
 };
 
 static const struct regmap_config rt1019_regmap = {
-- 
2.30.2

