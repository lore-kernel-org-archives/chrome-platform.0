Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A033C9
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:11:05 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqI001835;
	Wed, 4 May 2022 12:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ejYgje9HqagfwzoIL31BPNfwXTOmSUzwvqRO0TyAMOw=;
 b=nphv6fWaL4wqwDYrYaUaK8atDXUbAjZY6lpZI9b0Yo32v4IZKHbI0ceQCxEkHBBCIWGw
 0m9qHjbGlRMMS6jzqmquoP5xXSXQ4dUWp2obbkq+ck0jLKcy7orqLPMZkPFn91nuZy8v
 N5vWByxx77M3Hva1eb9IJ/2j0N/jNZQewYyVh4IYMJs4pXmHtEJ6yhOjX8e4po88x7Pw
 BIRUuXJVKHwbtguU/u9KFAnfRw0eyk31kZiPPqPolE7jBG/VDiK2N/b0exweQz8XWznp
 EwTt1MaBJzaiPsbEJ/krHtNCya1YzMm4mgzQCWq8A0PNafiG/dfTH4dQazgONfPZlemT fQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BE61B11DA;
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
Subject: [PATCH 28/38] ASoC: wcd9335: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:55 +0100
Message-ID: <20220504170905.332415-29-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: J_K4O-QsKEZMDWeHjNL3gxPfJwaIhO_K
X-Proofpoint-GUID: J_K4O-QsKEZMDWeHjNL3gxPfJwaIhO_K
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a SLIMbus DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wcd9335.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1e60db4056ada..617a36a89dfed 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4924,6 +4924,7 @@ static const struct snd_soc_component_driver wcd9335_component_drv = {
 	.num_dapm_widgets = ARRAY_SIZE(wcd9335_dapm_widgets),
 	.dapm_routes = wcd9335_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wcd9335_audio_map),
+	.endianness = 1,
 };
 
 static int wcd9335_probe(struct wcd9335_codec *wcd)
-- 
2.30.2

