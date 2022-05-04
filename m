Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDEF259B
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:11:02 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqH001835;
	Wed, 4 May 2022 12:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6T9M9A8qmtWRhAQM/eEcJ8vlYFc7MUDIzo6kcCUPEvE=;
 b=m2rn67RELhxoOJvMQWujGF4Xlkz5mIoPUi+cIQthnB1GrcHX8259G9LWNGN/97tWsvmC
 xik9baUBW31WM/wkS+fcGCZKD/vvVENd4jGWCUrOFb24tcBGLZ3zHL4I+tMK1/ekXXVh
 UhAZjwV/38vKgRv7RxBtLNfX0Hi2ZnU2TisJkcicAEZOTOjv5FpWWelLVWuIPNxw2y9H
 KI6PVeA8URPZsoCd3NvifOco/QUHRI8ZZjvMt+QzMBZ3eokECMnCvv157kk5CpI/NPZz
 jaRV8civHArQGUAnQM7A3TV5fWEAGVpB9Cm+ACfW7jjWDLhUSXmuYniNitx6SXqOjRUt Ag== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AD2C6459;
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
Subject: [PATCH 27/38] ASoC: wcd934x: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:54 +0100
Message-ID: <20220504170905.332415-28-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: gi_pbT_KW1hcz6LAtRCP1oIkTok3JIdd
X-Proofpoint-GUID: gi_pbT_KW1hcz6LAtRCP1oIkTok3JIdd
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a SLIMbus DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wcd934x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6298ebe96e941..f56907d0942db 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5847,6 +5847,7 @@ static const struct snd_soc_component_driver wcd934x_component_drv = {
 	.dapm_routes = wcd934x_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(wcd934x_audio_map),
 	.set_jack = wcd934x_codec_set_jack,
+	.endianness = 1,
 };
 
 static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
-- 
2.30.2

