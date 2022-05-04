Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A502596
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:36 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqD001835;
	Wed, 4 May 2022 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zHG4IIp2v5YYq2OpqzjED78DTsSBjDIKTwo+c5+pZws=;
 b=WT1x1o/FMjoMeIR9bTK8Ihw6Q1LZa5VTkD3+scz+PKZWxtTqkHeRUerWEYWaP0Xndg/8
 Srv7a5xnuFi4uYjQqCSrtZwcXZL0jGZ+C+oZbR9ay5820jTs3psrDoKYQ+rkqhGo17B9
 SXgZGFdeA7UDPKBmmBIi0dF7XAk3RCjftm9dd+v2+8NTS+5rEFdNcSU2x11XLPvJOOtT
 76CGnLRrQJUr2fHjUt0qXaHXrKn/vsM5D1sbKokwx9vLp81ql35KGU1F1o9sCbOt660n
 hjXwyow+BmryyqNHMVl0fWs2FMOwpO+pHJtuV9qapBxE3vzHkvD0Iz1reLn8jGO66NCh Eg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 28DDFB10;
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
Subject: [PATCH 16/38] ASoC: lochnagar: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:43 +0100
Message-ID: <20220504170905.332415-17-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: xJthe743gBOpnp_5s8MdH0wAQ8-yZll3
X-Proofpoint-GUID: xJthe743gBOpnp_5s8MdH0wAQ8-yZll3
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/lochnagar-sc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index 54426a90bc0bf..54a8ba7ed3c20 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -212,12 +212,13 @@ static struct snd_soc_dai_driver lochnagar_sc_dai[] = {
 };
 
 static const struct snd_soc_component_driver lochnagar_sc_driver = {
-	.non_legacy_dai_naming = 1,
-
 	.dapm_widgets = lochnagar_sc_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(lochnagar_sc_widgets),
 	.dapm_routes = lochnagar_sc_routes,
 	.num_dapm_routes = ARRAY_SIZE(lochnagar_sc_routes),
+
+	.non_legacy_dai_naming = 1,
+	.endianness = 1,
 };
 
 static int lochnagar_sc_probe(struct platform_device *pdev)
-- 
2.30.2

