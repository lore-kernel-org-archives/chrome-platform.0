Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82629B4
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:23:45 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq9001835;
	Wed, 4 May 2022 12:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=T9KL56a1/G+fLAhs8sc1+lv3MqOleTG5XD8n6KcbjrY=;
 b=JiZvDgSnIvmJrkAllsIP+LXAlSUvobZi4ZMSJ1MlExr8vhNx3bDMWlgHN42uEo9mIeUs
 jYGg4zJad6YaW1hQWOcSy9lOvS100BCQNV850nEJ7GVvH4SdZb8kvFaFD97iPDJzEWy2
 cHJA8/H/oqxn0wh+vUmU64Ywwx4ofmaDW4ewTlyn5M03jRm22+rec6JHKZre4K2s6EN/
 zHs15aqzdrakKZpKgr/kF+gCeoUJrQzU9ivrDIYEOgkgln5+I+AXxMBhmRevD8tGGPYa
 etnmBVjDTo8lPD2Sk7vBPwAQB3lYUlE3o1S856G6ICMf4sxJ2rw//G7aTAzJTo90w9gR cg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C86C011D3;
	Wed,  4 May 2022 17:09:05 +0000 (UTC)
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
Subject: [PATCH 11/38] ASoC: max98504: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:38 +0100
Message-ID: <20220504170905.332415-12-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: s7w-r5jABQ_Z0HU9wdvj4ULTDbPmmfaw
X-Proofpoint-GUID: s7w-r5jABQ_Z0HU9wdvj4ULTDbPmmfaw
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a PDM DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/max98504.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
index 9da7381472e3b..0daa2a3dd6215 100644
--- a/sound/soc/codecs/max98504.c
+++ b/sound/soc/codecs/max98504.c
@@ -291,6 +291,7 @@ static const struct snd_soc_component_driver max98504_component_driver = {
 	.num_dapm_widgets	= ARRAY_SIZE(max98504_dapm_widgets),
 	.dapm_routes		= max98504_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(max98504_dapm_routes),
+	.endianness		= 1,
 };
 
 static const struct regmap_config max98504_regmap = {
-- 
2.30.2

