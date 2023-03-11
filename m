Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D4E4D5
	for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 11:17:03 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id cy23so30640741edb.12
        for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=;
        b=ghNsLS5SpFOkMhJwbC4XS8uoD5BFbmT7NzIgtfULzPzTvyI6QOO4HG8pFT6C5UGUat
         mPQjoT0+sT0CMzL6ME0C9Y7HgaZfd5r5Xw4O7S9SIWwXUXfVZTxxRURXoBMwbLdb9gGa
         HDdJT2S0B0Au5ZAlepE+GieSNxYU1miaru7gYjFtSzq0r4EAOOeYmyvSqOnuvYq3AZ+P
         cDsUDnxd/3IbWY4dvOjVfnM5uW1UsHGO4HjnbrWw78+Q4BG/Mgpam7LHpxHdbtD4Qg0u
         6gMJzi0QokME5X3W0CknQVOhtzGKD1hmJ+bkvWUYiErUyxxO33PDCAakK4egTqj6Vg1i
         5RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQMu1OBGcFAt/9oWZHzoRm8MXiI9ypYZwvYh5dmA858=;
        b=Y6InGFphM32bQRvEHGN54JWRA3fdKzWD8pmNAfKxrivSGN38dKfCMUGSrKygIr1RFS
         L/MAHIJB42xQWRO78nmLPx+aIA4Mfehoqm3NmiD1T5mrlEN6rBWtoFEcoO+uJUKV6iyZ
         1MQJaLHho5TRxOYjveRmgKaQvBlYIQqcoUIURvs9sN1F+qOW5jEmN2oi46VGjCS1Xfps
         8cfuV8VYmBuaKGc+flODetfVE+4woFqalGTvMk3nVmyytM/EdWT0w1kdNAhZPy5n/+8W
         SlQC9EkgkpOBPku1Xqhf37RNl1w7+UNe4MJcSP30rhkNtMRM+DKTZQv7BFT3qx0wVY+Z
         xcnw==
X-Gm-Message-State: AO0yUKXdMazKvxvy0GeATWc6nriomwX4X/T0+tLcTOv8b4H8sUXjAxPY
	M0X4iYtU2Ok9EWXhLxJKVskLwQ==
X-Google-Smtp-Source: AK7set9fN9lhkzsTcd/hCm+YqcO1tpXtDV/ErKyu7Dxn7TQH6PWFP0BxhlriXHSFNitMA1yqiFIQRQ==
X-Received: by 2002:a17:906:1ed1:b0:8e9:6f9f:7c2d with SMTP id m17-20020a1709061ed100b008e96f9f7c2dmr4914227ejj.35.1678533422221;
        Sat, 11 Mar 2023 03:17:02 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:01 -0800 (PST)
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
Subject: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:16:55 +0100
Message-Id: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
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

  drivers/i2c/busses/i2c-owl.c:510:34: error: ‘owl_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-owl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 98882fe4e965..99ddd8894964 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -519,7 +519,7 @@ static struct platform_driver owl_i2c_driver = {
 	.probe		= owl_i2c_probe,
 	.driver		= {
 		.name	= "owl-i2c",
-		.of_match_table = of_match_ptr(owl_i2c_of_match),
+		.of_match_table = owl_i2c_of_match,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-- 
2.34.1

