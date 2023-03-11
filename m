Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73387B
	for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 11:17:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id da10so30820671edb.3
        for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dqe4tA01u8D6zg7qVVNxLh27ygPQ0D7vH2s6WJVZu1g=;
        b=hs+KTaByhaRR1Crrvl/6b7Pi+5fYgw3OGDij24beVPHGJ3OBSZd2iaAtQvl435zoEz
         TIAJ9/yjnEW/vbI+fI5bN8m0Gv0bfx0pJTDZCvvL/7YiwXCdftTPM9j1an+cfUzwjXpy
         eeKWWGgAuRlTeSjhytqdKpzqpWEz+bYEM4w8xux4YzWgsMLUxbQTMzP/6ejxkRp8B832
         jKK65FakobFYuKa47JSpRFPgY8SdUGaHFWWKuJIG+tEY+A79f8xkImbMyPeetoZGZNVQ
         /qK1WGpBdfEU2vtexd3E1Kj1odc0bHgoXMoxEAnImUg9RaSuYG1kxkO1HJDqnCfPGg8n
         wZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqe4tA01u8D6zg7qVVNxLh27ygPQ0D7vH2s6WJVZu1g=;
        b=skyQt9O2C1kI84pnsx9/jN0s1ab1XmQd+4cAlsku0GeWCLXqQX1mUZhqNBLhhbLv7K
         8GNbtyK6emT25d3THcqXYK7E055wD+TpvefpoC2Onfxv50d/fZTdj1q2iNhTBF5oyExr
         BHBH5sKU8lcMX4g7UIB4NCJO8U1fJqwF5H2zD54GLfk8x2IRH//39gwg/gjFA+3UtEsK
         Vi4vb+E0Ey79HICXhail/PkNx5Mh+e4Rq8+BhRwZfLFlC/YGDz5IGcc6SNAh2J7wpE4o
         a7f+F1GHH4pqHjQibeRUn/yx9pM/th7MXHGAKffW+CGcolkqA5ygcIY86ZeuAMEXhn8h
         YbbQ==
X-Gm-Message-State: AO0yUKVA0k5jGyb2VAzbsoCKg9C5oEKN1w6Th8bAZc/ghMs/BIPi8YeW
	3xBhTjJ+bP3k6ajmSo8Pl/2AJw==
X-Google-Smtp-Source: AK7set9ps6Xl+ULaLLmt1Jk7XfUchILOeDp/mCfvP03IeYFsPT68lmc3NmDip9szz/n3mavp5ht89w==
X-Received: by 2002:a17:906:1515:b0:8b1:279c:82c7 with SMTP id b21-20020a170906151500b008b1279c82c7mr27776179ejd.50.1678533421024;
        Sat, 11 Mar 2023 03:17:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-i2c@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:16:54 +0100
Message-Id: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/i2c/busses/i2c-mt65xx.c:514:34: error: ‘mtk_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 43dd966d5ef5..59eaefe999b1 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1546,7 +1546,7 @@ static struct platform_driver mtk_i2c_driver = {
 	.driver = {
 		.name = I2C_DRV_NAME,
 		.pm = &mtk_i2c_pm,
-		.of_match_table = of_match_ptr(mtk_i2c_of_match),
+		.of_match_table = mtk_i2c_of_match,
 	},
 };
 
-- 
2.34.1

