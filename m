Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509833C9
	for <chrome-platform@lists.linux.dev>; Wed,  4 May 2022 17:23:47 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVqB001835;
	Wed, 4 May 2022 12:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=5JiuIEhDikkLVhbBXJeyWEMF0IBNyZgZBo3sIH5tJZo=;
 b=XSPxP1eVJnbg1yCNfjFJ3x0XlX2h+RbUZLVRSXP2J+6sZd4v+bPWxU5qJJ/lB12TbPg7
 qUDFjKJ+g4ty93z1T75G+VYjiuKhw+tAJW0veuBWdqQgSz2VPCajaOg12JOQGYWmInzL
 s5/egzXpUOI7D+27qXb+pJPAO7MvMSik3qwDO9PbevS+K/isoWurQEN5UpevK8h501e1
 DLAnRldm8aS+7zzRcnEOJZ5eHE4/KZqqq2z7U3r7ILs+hwH8jpwZKZsb4fnWSvJQ+9jv
 gVt4EWZ6jULZvn+bnlLXhp0M0/oPmuKzT5LRpMglK28/SVXH1qcouTEPx0vf3MGh/Wvs HA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 May 2022 12:09:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 4 May 2022 18:09:06 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 073F611D3;
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
Subject: [PATCH 14/38] ASoC: cs35l41: Add endianness flag in snd_soc_component_driver
Date: Wed, 4 May 2022 18:08:41 +0100
Message-ID: <20220504170905.332415-15-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: 51Xi19Uu5Rj-DDfMBYfFGvQtEL-fE54J
X-Proofpoint-GUID: 51Xi19Uu5Rj-DDfMBYfFGvQtEL-fE54J
X-Proofpoint-Spam-Reason: safe

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6b784a62df0ce..de6f96bd8daf4 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1113,6 +1113,8 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
 	.controls = cs35l41_aud_controls,
 	.num_controls = ARRAY_SIZE(cs35l41_aud_controls),
 	.set_sysclk = cs35l41_component_set_sysclk,
+
+	.endianness = 1,
 };
 
 static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_platform_data *pdata)
-- 
2.30.2

