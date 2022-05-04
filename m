Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C11F2599
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:20 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsAA021058;
	Wed, 4 May 2022 12:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Kh0pzTHXmAUdN126RAAZDrIy12vFDLPkQR7/bwI2GYE=;
 b=hukWhjCo/UXsKj6wsfiA4F/7ugP5duEVytNQrubD8lSagJx6BsqsO4HCJRuk5WJOaBBq
 azdRI7YnktfKQPYQWPUiOd+G+1olO6r7HKY5RJofYroO3Hb+eBBvchuVtaGRF/P3+Zc8
 JFtjlTqYXLPgE2XGoeaR6MRAcwCD7fk8eFUeEoWHamEwrfXT1VjIBfOtPdOkFt4+ro9b
 k/Ui6X+/FnsiKDxHSkrUjA83U+uotDcv/xuTy04Qmlvv0KuWpL4rsiBhKpz94y7pm0/g
 sgInvA3NUnDpZaFVtdLOYrMiBZVAIjF0Vou4Wp3Z/gOstrouB92vuBJL15LnSGBHTst3 1Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9314459;
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
Subject: [PATCH 12/38] ASoC: adau1372: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:39 +0100
Message-ID: <20220504170905.332415-13-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: 8-oc2LovoHt1GPeRlqlvxht7ZimDRRsV
X-Proofpoint-GUID: 8-oc2LovoHt1GPeRlqlvxht7ZimDRRsV
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/adau1372.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 1faa4c4263650..a9f89e8565ec6 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -859,6 +859,7 @@ static const struct snd_soc_component_driver adau1372_driver = {
 	.num_dapm_widgets = ARRAY_SIZE(adau1372_dapm_widgets),
 	.dapm_routes = adau1372_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(adau1372_dapm_routes),
+	.endianness = 1,
 };
 
 static const struct snd_soc_dai_ops adau1372_dai_ops = {
-- 
2.30.2

