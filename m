Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5F29B4
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:58 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAF021058;
	Wed, 4 May 2022 12:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BHm+uV8TFPL6uNqFJQSU9rM2izoo4+rCSvAkx/wG6j4=;
 b=m6DPFmAw5JDFldul5FvwVruqVS+W7/KNzAR6tWFzSpvDeB6d6gt7ZTDJ2rqxM7Ygcn8Q
 Zek9oYo0Mn4IA9dv5iTpWRy/atBgYpHJSHcITbFr9+v16qmcl7PtvkRYokPlGUt6Dq3F
 ci92b9Ng5xEGs45WdZnNzmysTBNKS518FcYwTYd/1gYijuNHFsU/+kNGVuPaENSx30JE
 QnKxZFG680WlJGFOp7tTfVMKwizsad3YWb2sBjSDHE9Wex+4AQoL9PZQFACI6EfM+UbG
 lfJ3FI+QNbBq17GGMkhFhjjcfOvZI8YQTkWoZbDG9pzNpc4DN0n/pG1hpD0Ka2Ntxcec WQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8413F459;
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
Subject: [PATCH 23/38] ASoC: rt9120: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:50 +0100
Message-ID: <20220504170905.332415-24-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: fyJnTCeBxQbMg9YcE7tEkyGXjwG_tlnX
X-Proofpoint-GUID: fyJnTCeBxQbMg9YcE7tEkyGXjwG_tlnX
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt9120.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 6e0d7cf0c8c92..cdf8ad2f23a43 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -178,6 +178,7 @@ static const struct snd_soc_component_driver rt9120_component_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(rt9120_dapm_widgets),
 	.dapm_routes = rt9120_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(rt9120_dapm_routes),
+	.endianness = 1,
 };
 
 static int rt9120_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.30.2

