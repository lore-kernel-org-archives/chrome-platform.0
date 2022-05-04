Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D129AA
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:50 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAE021058;
	Wed, 4 May 2022 12:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pu1yL3t35fV5PJ0qbX3ymEluFISr4S0pQROfp4ZZd3A=;
 b=M1t2RcxPhVBeo/TnhwkhMFreVqtM2Wou/v1Zamdh0iJfhKdIfj3Li6ZDK80/h9MQoZ+O
 7wzWH4NidpoXAs+5Pd3XvRd4synqfiFdNzMOLNG+siSSPXZ1u7Jtlo2GA6df23eQFi5V
 oL+3EcK8vUjU496rmOVi6LlrbEx7qjWmZ12YeiFbEjtvJu1Cx2QW9pyLNeuX3+YkN5IG
 D7jAfv2ZN28kZ+htacfEmt0eBDkXmAklq2zDpIoMfRNKuKbdHuMJEuiSCYlicFcDAYTg
 OCC5PwaEMPy6derDA3ZRN1eVJ0I8f/RlxhnTaiPWUR2m0gmIP9w+I0qIQsrr3fzV24t6 9A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-10
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
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 50C4E11D4;
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
Subject: [PATCH 20/38] ASoC: mt6660: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:47 +0100
Message-ID: <20220504170905.332415-21-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: keH_lpea4WhIi3HcdToFaIe7mrWrkwnX
X-Proofpoint-GUID: keH_lpea4WhIi3HcdToFaIe7mrWrkwnX
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/mt6660.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index c84a0b850f89a..ba11555796ad8 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -323,6 +323,7 @@ static const struct snd_soc_component_driver mt6660_component_driver = {
 	.num_dapm_routes = ARRAY_SIZE(mt6660_component_dapm_routes),
 
 	.idle_bias_on = false, /* idle_bias_off = true */
+	.endianness = 1,
 };
 
 static int mt6660_component_aif_hw_params(struct snd_pcm_substream *substream,
-- 
2.30.2

