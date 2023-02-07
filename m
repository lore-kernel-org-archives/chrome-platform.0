Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177CBD3B
	for <chrome-platform@lists.linux.dev>; Tue,  7 Feb 2023 09:14:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d14so12823921wrr.9
        for <chrome-platform@lists.linux.dev>; Tue, 07 Feb 2023 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnOMeG0z+YCevJjETbIYGt07S+IbdApmVaDUDwVjN8U=;
        b=iqlAf7IGMyIOrcKjo+GQMhHPJG6L6QvHww9wyGLEFS56jdFszjRj15dzxrUf6AMNBC
         RDsxjqagk1CLTr8CwmHto2Fz6sq+pgCqj640Km2/vSTeqO4frnXLFWq6wgtHyteVFM0d
         95HOJ1JP26R16VXiWvMb2xQFoHzePRnjO85XemX8yWzYTweqk0xr/0xkmT/aUsdaoic5
         VF8x0bmepJSwpe6y9rwpC3m61PYM04SunqcFQvUbAc4stRekVH6AQynVJki6LRemKp6L
         uDrHlxrGnHEQ74VibFi2GYvH8ycHsMHnITQNKPxapKQPLLSlUUIFpEzsoYeSpBx0GC5N
         yHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnOMeG0z+YCevJjETbIYGt07S+IbdApmVaDUDwVjN8U=;
        b=fbIESbd24+MfcUTKNYFz3eOMmYaoiLK4lpD6oh+KAlq+wF828U5pTekXN1vzxUrvG0
         7vfxR/LNx2XzQvQjaTxewyAAkU0V/VZU4uQAcZWXWhZWbU2YggrpDqHWJCRCXEbPHv92
         0k9bTqXQ+gm5UhmZUSj63+7NCJDfpzNg0LzFsK9qHhTDbDL/8N79EbO9lQaWKZuhiIaM
         zvfMCieYy49r9BCI8cMpf8498Cw23qiaGS+zN1ghQ9MOyHEZM4qFw0b0elM6531GOqXY
         aLzdAerCJ1YCUVCJFKFfxjkOZbvpL0ct3yqG3E5udltjOBSnLSnf8rKDM8Lp0KnS1+cm
         v4hw==
X-Gm-Message-State: AO0yUKXNC44jBmHjTA6BU80bhUHYfaNzCkImimuZefMdQE4ffWsFQUN5
	FTDaBot2+3i9Qnd972YA+fY=
X-Google-Smtp-Source: AK7set95oC0Zx1vGd8VPUnITmIN++zR08TCoUYDCujeSmKMmRwYBoI5qC0HZN3YdOhaYkVNR6b9BcA==
X-Received: by 2002:a5d:6447:0:b0:2be:57a6:8161 with SMTP id d7-20020a5d6447000000b002be57a68161mr1879784wrw.46.1675761285516;
        Tue, 07 Feb 2023 01:14:45 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d53d1000000b002c3ebbc9248sm3704990wrw.66.2023.02.07.01.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:14:44 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion" -> "attention"
Date: Tue,  7 Feb 2023 09:14:43 +0000
Message-Id: <20230207091443.143995-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_warn message, make it lower case
and fix the spelling.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 71f5d7d8e055..a673c3342470 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1020,7 +1020,7 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 		cros_typec_handle_vdm_attention(typec, port_num);
 		ret = cros_typec_send_clear_event(typec, port_num, PD_STATUS_EVENT_VDM_ATTENTION);
 		if (ret < 0)
-			dev_warn(typec->dev, "Failed VDM Attenetion event clear, port: %d\n",
+			dev_warn(typec->dev, "Failed VDM attention event clear, port: %d\n",
 				 port_num);
 	}
 }
-- 
2.30.2

