Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C233CA
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:11:10 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqL001835;
	Wed, 4 May 2022 12:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JqSf8VsPjntcp5+sVo9w9XAP7mcs6Ljk8Rzl1377l6Y=;
 b=GRQzIO3FQbqPnzi/Sl6F8ofmjSVwCQtzikrUVdE4BaAhXpZi6ktFjeO+CXXz8a55M8Tq
 a8YaPGXFkMh8ifa12sLEZ4GLPhvBkXbH4X4emCH3OuXSSqUtnG6d/Rpx/9YpuOOEHvKv
 sYVTkmUyVGyH0Es+JE6wW0vm9F4DU0pl9ovBIVCq7iwEbNvCw8zz1RcTji8BOTiL4ex2
 5YSJzypSGU4nwN+TTvfsZ2TX1/u0Wzh19QyfPRzgwFXjB3XNie/tB9BMYxuIsOZa13iT
 l3HZcmXO6NM/MPBpZXF6fbJovQOmg0iY0J+BTURf9ufA0brRVAxLUhjZTgv90Zyqu6vN Qw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1E5E511D3;
	Wed,  4 May 2022 17:09:07 +0000 (UTC)
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
Subject: [PATCH 33/38] ASoC: rt715-sdca: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:00 +0100
Message-ID: <20220504170905.332415-34-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: mznjTn6v-52Iw12vAStACPKiCs_uuPOz
X-Proofpoint-GUID: mznjTn6v-52Iw12vAStACPKiCs_uuPOz
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a SoundWire DAI and as such
should have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt715-sdca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index bfa536bd71960..5857d08663073 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -765,6 +765,7 @@ static const struct snd_soc_component_driver soc_codec_dev_rt715_sdca = {
 	.num_dapm_widgets = ARRAY_SIZE(rt715_sdca_dapm_widgets),
 	.dapm_routes = rt715_sdca_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(rt715_sdca_audio_map),
+	.endianness = 1,
 };
 
 static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
-- 
2.30.2

