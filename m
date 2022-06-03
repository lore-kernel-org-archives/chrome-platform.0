Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50755ED2
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jun 2022 13:10:54 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id d129so7175136pgc.9
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jun 2022 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ODbT0QmWB07HWQTaFHLu0hivC2LQ/JBbuZ19CEiGVKM=;
        b=Ujk00q4GB9oPPURMhFVVwAwk0dUMGhQ76fKMOl94E00NDlBzmec8WnG80cYUoPQxDa
         uyHoSvt7Nv0t7hBT8kV61CzcV9zBn7zHIhctmnhq9VW7SgOApql44cEt9RIyDxd7T7gJ
         QH71bCiTFsi/K+KKjS9ut10gaB/rQyQklxU4wSxS6jWKjeEswiYC9AvYH28+8tg/wtjm
         ku2Kc6DdXUkTTtAeOcUJ+0673SS3oIRr7EkHdHOE9A/GFlsT/CqAzSW7hm1Qez17K87g
         NXkJtFHGc5FF+Rvbicrt5BTGlscw3ZACG5834nzQSkCim2qiCYfjGK3usCH9EjyTwJX3
         JTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ODbT0QmWB07HWQTaFHLu0hivC2LQ/JBbuZ19CEiGVKM=;
        b=5mOVbAYRVLYHiNMWMCeBeEK5+GLPClf8YzVGvWtc7fWzP42hBsAPegdCPXs7DJH9o8
         AdMLVApCYEyu1YWPPHRoSH4MmmrJqC3gl+04vqAJPpG8G21OpKn5ZIZ6bx8pwnTAmsdT
         QKUxexd0Ai/z1f81xKJqt3c6kK2UJDmuhjSctflWcJSU4EDmxAY3tAckbgLdEV81ipJk
         Mx7KQISrFeydp801V6S0TPmWQmjfBT/lJC9xPpS520gLvhZPZXs7B8kg5QuenAE+VSRu
         bShy5NXoRY/IIRGecvnk6gGA+66o6/dUHekIdKAY7EsyrNCyEcWe7X+a0fwvrcYW9YdS
         splw==
X-Gm-Message-State: AOAM53206F6yMvKLX4ikcsVWsDeshZyoVYRGF+xIs2q19+zxY6ZQyuPh
	1sCAT4H3oUZkq6kCsGOQNOM=
X-Google-Smtp-Source: ABdhPJyncMHC8GX1hRGNfDO4RAiZqdv/DEEl//mlI7eR6BEaT34FyQYkwf35dD33khPIgmRlk33AkQ==
X-Received: by 2002:aa7:8e44:0:b0:50c:fc0e:8d25 with SMTP id d4-20020aa78e44000000b0050cfc0e8d25mr10473724pfr.81.1654261853775;
        Fri, 03 Jun 2022 06:10:53 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id a3-20020a170903100300b0015ea4173bd6sm5279133plb.195.2022.06.03.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 06:10:53 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	chrome-platform@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
Date: Fri,  3 Jun 2022 17:10:43 +0400
Message-Id: <20220603131043.38907-1-linmq006@gmail.com>
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

Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag
v1 Link: https://lore.kernel.org/r/20220602114529.6303-1-linmq006@gmail.com
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

