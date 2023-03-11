Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CBD7B
	for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 11:17:06 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id er25so2611578edb.5
        for <chrome-platform@lists.linux.dev>; Sat, 11 Mar 2023 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=;
        b=lKEQi5BZGiIsVpqyS3XtNgZoaI8gioPoWmR53UPyduIVkHVeBEbmWQaXemsy7pgoPS
         UnT7c+7ZyvKkk0HWLGJmgAwsttuT4HVispzrnMPyJqS5Np8eI3GRYyaG414K6oVMRNUm
         QVqgb3m4l83Le3oN3ft7CuJLwMHw+hjFZgSFgWC2j9v5by9CxRRgC5nDXDsaxyZluBqk
         IBiUAyVvuUjg9DW9Kn9dcYeNjBhKM6POvPlVnUnZ/vXpWzeI2pXo9U2pZhSrlCZILBwz
         d44tevPSOVgUvRM+45bqyA8UKyptBc/JrFkZ7kGJ3iXRmTNNXy16orqGNh57sQxmaXAQ
         wENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcJifq10PLRhKC9buL1zZTG6brvOgNimyFGPw1oZQ8g=;
        b=H0WTcWYGzsL/4iVyi2mocySGx5qQ3o6ggu8VILcimEGK5oewg1JLOyySdg3r5LDRBV
         DJZmJJ5VT8+CKJyFYCu4+lwvBAQgfP3D24WJiXOnqETbUf5YpJSyFSAo/zS/tURYKo3u
         o0Murd9ThyPSra8gFQgK+fhVP66xxEuJrCYDSdS7Ch7UNr/jSEZ96xBRXnkt3evMZqpy
         +SpnhSNQYSoEx2N4/fXiG61cOG7tEjiBkr1dO8GJpJzkdhbrTWjpeKEjTOu6l6ccaIzV
         45Ec3PSwJ4a1ufXW0G39iw6cdrga9tnykZmuzC1lsYPHrSllRfbIioc5Afot83c3CEjy
         XrHA==
X-Gm-Message-State: AO0yUKWPNNRhLF9H/fwKcfuU/3A2rN08x+VC3u5DxwdeNjN5jD9yaWZN
	KOn6QDNiq1uAAzIDnJZ0aVtKkQ==
X-Google-Smtp-Source: AK7set90Rqx3sRtuOK2S/VP6FZHdkiLyZ5wFXMpa2VaqCReSCM1nTUR53MQaNMHyzGhGC7lvJVRG7Q==
X-Received: by 2002:a17:906:e118:b0:8f5:2965:49f2 with SMTP id gj24-20020a170906e11800b008f5296549f2mr5109281ejb.23.1678533425339;
        Sat, 11 Mar 2023 03:17:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id mp27-20020a1709071b1b00b008d398a4e687sm973975ejc.158.2023.03.11.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:17:05 -0800 (PST)
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
Subject: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:16:58 +0100
Message-Id: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/i2c/busses/i2c-synquacer.c:632:34: error: ‘synquacer_i2c_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-synquacer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index e4026c5416b1..50d19cf99a03 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -629,7 +629,7 @@ static int synquacer_i2c_remove(struct platform_device *pdev)
 	return 0;
 };
 
-static const struct of_device_id synquacer_i2c_dt_ids[] = {
+static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused = {
 	{ .compatible = "socionext,synquacer-i2c" },
 	{ /* sentinel */ }
 };
-- 
2.34.1

