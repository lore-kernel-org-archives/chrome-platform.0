Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E6A259B
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:36 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAD021058;
	Wed, 4 May 2022 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PRSBmR1vLscIqyEvR35nn0Bdk4VErdfF+QcvigdBmR4=;
 b=BcRw2krZWrkH7ct371SCR0lrvoGMVYQPvON5P38A/T+NNU+WUw3RBJmz+YelcQxN/BY0
 PoNm7EE7WiG26YqM8oCLU4+NeTEkl78BiwVjZLuXxuvUxcig2GX7CZKtUv6nFom31WMp
 YKM9U8bwkl65RaV6bbxJZeQlsWJdgi4nYNxB66B0qUld1sVRyrk8wYwkwSxeHpnhZHXa
 /iurcW+sDUm1Qfifv2ThjMauSWJJtJcuCmt9x1JCFI266o96rqCf+NEAwDg0I3TrdS0Q
 gEJf/sfrbpRqfUDZmkfBY7ZzUV0XcGhPJGOv6HM82EANhx7e+Onud81CrGXb7NPWhKUB Yg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 61BD7459;
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
Subject: [PATCH 21/38] ASoC: pcm3060: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:48 +0100
Message-ID: <20220504170905.332415-22-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: rH5_Y_FmF_PjRbNP32lgmw508FUj3XFL
X-Proofpoint-GUID: rH5_Y_FmF_PjRbNP32lgmw508FUj3XFL
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/pcm3060.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index 4e3bfb9fa4442..586ec8c7246ca 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -255,6 +255,7 @@ static const struct snd_soc_component_driver pcm3060_soc_comp_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(pcm3060_dapm_widgets),
 	.dapm_routes = pcm3060_dapm_map,
 	.num_dapm_routes = ARRAY_SIZE(pcm3060_dapm_map),
+	.endianness = 1,
 };
 
 /* regmap */
-- 
2.30.2

