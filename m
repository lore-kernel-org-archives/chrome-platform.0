Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99413322E
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:23:46 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq3001835;
	Wed, 4 May 2022 12:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=nYqn+GKDwKK25SWBWrV7lsZ0+GOZYWJKCzdENLiH9ww=;
 b=IVSgAPrHiyeXAxkKJRIj3MjXdfnaaFqhINpR1iewvscmkwA+fwtjsIpdomwDpVx9aiHQ
 p+8o32SAma5kWk3159tEYMzKODmo7Fpk4a6xSB3kA1MSLJIPguYUmN2T6TXwaxKM3TNG
 0H+9yNo3vQM9aMVZBnmSWHX0P8ejLIuPjgRV6t9Yhv6OBNv2Qto/607putTI2d2jZA64
 l5q2VjZpzk3expIu4ISxXt535LYtERC8jQzrR6DugxzZ4qO/CnwN8hGu3RwE77tatxgr
 qezTANdCYDusj86YeEoDJom7t/wNORMQre5GBswT0kGs62GI/xqlY7LOrHweaBlJekbn 8g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 330FFB10;
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
Subject: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness flag
Date: Wed, 4 May 2022 18:08:28 +0100
Message-ID: <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: 7cO-NHnns4JYpS7pti-6iw9cMIvGoLBc
X-Proofpoint-GUID: 7cO-NHnns4JYpS7pti-6iw9cMIvGoLBc
X-Proofpoint-Spam-Reason: safe

Add a comment to make the purpose of the endianness flag on the
snd_soc_component structure more clear.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 766dc6f009c0b..5a764c3099d3e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -169,6 +169,15 @@ struct snd_soc_component_driver {
 	unsigned int idle_bias_on:1;
 	unsigned int suspend_bias_off:1;
 	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
+	/*
+	 * Indicates that the component does not care about the endianness of
+	 * PCM audio data and the core will ensure that both LE and BE variants
+	 * of each used format are present. Typically this is because the
+	 * component sits behind a bus that abstracts away the endian of the
+	 * original data, ie. one for which the transmission endian is defined
+	 * (I2S/SLIMbus/SoundWire), or the concept of endian doesn't exist (PDM,
+	 * analogue).
+	 */
 	unsigned int endianness:1;
 	unsigned int non_legacy_dai_naming:1;
 
-- 
2.30.2

