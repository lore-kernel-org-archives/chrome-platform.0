Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88382F3F
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:11:04 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446OEr7006119;
	Wed, 4 May 2022 12:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Q1qnkI6ceLryS3eun8ThE4m+M79PwQNlKTl9uJLd2Ac=;
 b=rGw6adPGe1H1PmprcepppJMP3rUta5zDdXexfIIG9wWJvj8AbxGdFlQ99zbHfF18fo5+
 bevRmgskuJZ6jyXQlI0CrxrFekQevFKdD1TsCXkuNu+8FLgPAHr50IZB1bmZkKciNgD0
 +jMAislesd0AYxMve7672xfZKNpaAQ412vO/cdo03owUX+oysMZRiT/ZPZlMrDKFv6Sx
 cT3KvtUrrfPYMAzsGJWUzhXrDNcswXkoouNVX9/4en6aBOUvLlK1xTV7bCd2yLT8FKHp
 ezmr7uiLlqb2G4QcnUOCstiO3SRKnCITvIpezpygvf58neWezbN/h0cmNvbOp/1drA24 CQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4007611DA;
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
Subject: [PATCH 35/38] ASoC: rt1316-sdw: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:02 +0100
Message-ID: <20220504170905.332415-36-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: JWytEEIa-LF_Lvgfks0hCBxxwsfj7dPY
X-Proofpoint-GUID: JWytEEIa-LF_Lvgfks0hCBxxwsfj7dPY
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a SoundWire DAI and as such
should have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1316-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index c66d7b20cb4dd..60baa9ff19070 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -597,6 +597,7 @@ static const struct snd_soc_component_driver soc_component_sdw_rt1316 = {
 	.num_dapm_widgets = ARRAY_SIZE(rt1316_dapm_widgets),
 	.dapm_routes = rt1316_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(rt1316_dapm_routes),
+	.endianness = 1,
 };
 
 static const struct snd_soc_dai_ops rt1316_aif_dai_ops = {
-- 
2.30.2

