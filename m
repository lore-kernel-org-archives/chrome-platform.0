Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE172596
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:10:19 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsA9021058;
	Wed, 4 May 2022 12:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Bmmthx4HxwtnY7/KFtIUkgtqLDABQy5EyuwvVvP+rUQ=;
 b=BliKbkyyoFc8h4SliQFpS1/q8k93AHMRUE+aRDaudeav331Fkx68GdxVSnPj3jhe7aVA
 STnp8nw2D6zjsg0kPsNmD98vjlEL4GkSfvZZRWtCZi6BwBdw2C63YQos2zMQspzC6QhT
 UAAdxnNfXSXUjY3/0/4yJqlI2HuKGaVQDY4VdrUNtcmlJYBW05LLwgWjdX1hmMFsVxJs
 3DFm2rYzEgwNAc1iLiMMis2wJMsyG8GQfRA5I5cEHK411Tc2tFUykIKSkObCfQpT41za
 Nk6M2Br07OOLQkqlKlzSHCMhNvv58yXA0w58umfy/pTNpuXd0GZHKPgT53j8+N4hcn6o Nw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9F5C2B10;
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
Subject: [PATCH 08/38] ASoC: sta32x: Remove redundant big endian formats
Date: Wed, 4 May 2022 18:08:35 +0100
Message-ID: <20220504170905.332415-9-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: qf0gy8m3VlR49dcYkW87828Y2Hp48cPy
X-Proofpoint-GUID: qf0gy8m3VlR49dcYkW87828Y2Hp48cPy
X-Proofpoint-Spam-Reason: safe

The CODEC already provides the endianness flag on its
snd_soc_component_driver structure, specifying it is ambivalent
to endian. The core will expand the formats to cover both
endian types, as such remove the redundant specification of both
endians.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/sta32x.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 0ba6eab991c4e..8585cbef4c9be 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -48,12 +48,9 @@
 		      SNDRV_PCM_RATE_192000)
 
 #define STA32X_FORMATS \
-	(SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S16_BE  | \
-	 SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S18_3BE | \
-	 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S20_3BE | \
-	 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_3BE | \
-	 SNDRV_PCM_FMTBIT_S24_LE  | SNDRV_PCM_FMTBIT_S24_BE  | \
-	 SNDRV_PCM_FMTBIT_S32_LE  | SNDRV_PCM_FMTBIT_S32_BE)
+	(SNDRV_PCM_FMTBIT_S16_LE  | SNDRV_PCM_FMTBIT_S18_3LE | \
+	 SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_3LE | \
+	 SNDRV_PCM_FMTBIT_S24_LE  | SNDRV_PCM_FMTBIT_S32_LE)
 
 /* Power-up register defaults */
 static const struct reg_default sta32x_regs[] = {
-- 
2.30.2

