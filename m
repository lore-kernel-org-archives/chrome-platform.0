Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845433C9
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:24:12 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsA8021058;
	Wed, 4 May 2022 12:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=asG25gcw2gLhMtNRJPh2lzCH/NPh3Or97R4QtsWlJ2o=;
 b=emSl7NHwuO9jA8I1KgzUcFMKFojieKBMP7G6kOhgZJODhiOHdIIqTgqqhxY3mG6/zj1b
 8roYOo/OLZm0+rChHeVWVCeX9tcdXoMhz5np+laHIlXm0OoVgrh366tsU7D5b2I35Tet
 7mQWtRZ4GnhWKE0PQYtIP0pjWFg3g+dKnMmF7gdrJEEhEAe1cKVxU5JGni1JkvbygpTz
 U3MVZuGqwzo+8qQvXdley15cfW6i0ArQbRozW8sAzu1K6QWgos1eDFTGl0H8/rAQLOSw
 zdk3qDcXHi4mcCojQQFFqDwvYCifmjW6xaA/PVOflAWuqbYiiaFPiUJZ0CX6r7+cM8M7 bw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 978F611D3;
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
Subject: [PATCH 07/38] ASoC: hdmi-codec: Remove redundant big endian formats
Date: Wed, 4 May 2022 18:08:34 +0100
Message-ID: <20220504170905.332415-8-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: H9Q2vaog5bkHBxsD2ZQXGM2LLOTlNoq7
X-Proofpoint-GUID: H9Q2vaog5bkHBxsD2ZQXGM2LLOTlNoq7
X-Proofpoint-Spam-Reason: safe

The CODEC already provides the endianness flag on its
snd_soc_component_driver structure, specifying it is ambivalent
to endian. The core will expand the formats to cover both
endian types, as such remove the redundant specification of both
endians.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/hdmi-codec.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b07607a9ecea4..b773466619b23 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -727,10 +727,8 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 			 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
 			 SNDRV_PCM_RATE_192000)
 
-#define SPDIF_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
-			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE |\
-			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |\
-			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE)
+#define SPDIF_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 /*
  * This list is only for formats allowed on the I2S bus. So there is
@@ -740,12 +738,9 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
  * problems, we should add the video side driver an option to disable
  * them.
  */
-#define I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |\
-			 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE |\
-			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE |\
-			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |\
-			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
-			 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
+#define I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 static struct snd_kcontrol_new hdmi_codec_controls[] = {
 	{
-- 
2.30.2

