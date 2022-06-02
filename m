Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668047E
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jun 2022 11:45:40 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id e66so4531516pgc.8
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jun 2022 04:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+d98QRju/iof/J3fqnwUoOBnWzIJ1MsMResY4ThMXQw=;
        b=BbGlo5bKFJ98FdM1OaSDYxQb5y8x7/n6+RNxsoobAWzJkuaAPlQoberr4i7ui0ZeWo
         m7mkIIC9PpknwkzVMuoVmmENO61cORNGJDsGXb99v+62IAkAbgJ9jpYYMemMdIrAvv98
         bqZTqBaYFYt+awEnpfswZXqwXZJsRAMTXoEPeKkBtOOr19C9AgZKkTZCXbgYvYpnbxi8
         eUfdf6Pb1ZiDwnzDOumHbZRtmQU/TkYa3xLRbIMKapFCTdFj0oLc/l3C5STXB8/E6/xB
         ojmj3dvE7WfO1EBWXpJ/8og1Ufuze3Zfahry58UBmL498SwhuRHvsklLkrQumYY01LwV
         fPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+d98QRju/iof/J3fqnwUoOBnWzIJ1MsMResY4ThMXQw=;
        b=Nu4vfeBmQz36VoXf1Br4yECwqeJiSXXjoa5zrwBd5JubeOVjFUBxQi3FqA31eEtHbm
         5Co2g6YA5JWbwPVsPQfiBjuLiQUu0DrTdaQzrJTFCJk4wyo++ypkfljBsQEKHGJ4nKQ1
         R++H+8YTSlvKUsy73fwgs7RPyTNOZLF3KpiDuC9TPckBcYrQvYI9WsYVbn6myZCQNUMk
         EhmNydYm7hyfqZQwG0bb+8TfLiNG6+R+pIhqll9hzqOL0aoK8UGt4gS7tDgFRp2RH8eN
         3+cjAoldiXHOObBXTNMyxG27IDI2d1fGP45OWUssk4G4aDfSCly+DSRiJvkpqNW2q7Xf
         qP/w==
X-Gm-Message-State: AOAM531W0DAir4G4MeqNHuG2gXgmFD4WVMZjviIz5PLCttDf2yfOyqPA
	BHRyNBHFom3YOlQfrgcWoG8=
X-Google-Smtp-Source: ABdhPJyLq+i7vaKBUknNiqsbWkl+78YNSRhu19ou3RjHDXCtiMckU2vPaHBuflOii75VX75Ob3CuXw==
X-Received: by 2002:a63:ef41:0:b0:3fb:c201:797d with SMTP id c1-20020a63ef41000000b003fbc201797dmr4090679pgk.104.1654170339825;
        Thu, 02 Jun 2022 04:45:39 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id s17-20020a170902c65100b0015ee60ef65bsm3221335pls.260.2022.06.02.04.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 04:45:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
Date: Thu,  2 Jun 2022 15:45:29 +0400
Message-Id: <20220602114529.6303-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: format:b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/cros_ec_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8b0a9c788a26..11e7b3f6d410 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -995,6 +995,7 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 			dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
 				priv->ap_shm_phys_addr, priv->ap_shm_len);
 		}
+		of_node_put(node);
 	}
 #endif
 
-- 
2.25.1

