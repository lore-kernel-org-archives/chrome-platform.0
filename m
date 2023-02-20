Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD763B8
	for <chrome-platform@lists.linux.dev>; Mon, 20 Feb 2023 13:55:45 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id a26so2964366lfk.10
        for <chrome-platform@lists.linux.dev>; Mon, 20 Feb 2023 05:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DE5alLbVy8X6VmLqkrTKXnAIc5UYOF+41WkrcJJn5G0=;
        b=iGl2W5X5EQLO43Kpwlp7zf+nkLaWQAz70M1gq/R/JttbaDhQoacKuhNV3Kc36ptO/z
         +4U/4NniaJF++prM+LkFJ6vzvv7Ix1m6/Uynb1ZC/5lLhRPpZXJ+RdwugmIltFEG80m1
         9WxHjtCn9GHtNYY0kb5qJ14EBGbTXQfOz5drlFMTgdNb4G/uxupYwH3JrUh2yaWhPKfr
         7PXnrBBICQOfcSQ+NLDh6YM4MWMYaXtaw69bjL6aJjBqt59UdpFGidLoHAaGfqsCMz2t
         hQeGlaEVtUypNUBWNT1Ys/oEMKuZqT2AbWfU+JKVZW5hF1MdAOIL56YUQKvVZwbBqi0R
         ARew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE5alLbVy8X6VmLqkrTKXnAIc5UYOF+41WkrcJJn5G0=;
        b=xsglCBYWjga/Aw8UMC/uILcrCzulQq/7LUUolzKhDwNhwFERq3iUidsHnrEVhc41Y7
         ZB4xW2A2VQyt/CVLyaZd/4EDEE165czRKwPlHa/Jf4Q+FxyMDTr7v255vIML/jO3SOZ/
         ntgVuCiHZX7ND1yu+YzPuCMS3kBOBAY5ciLSHRPoUxtBRrVhzd9iRDbGGSUVuz0IKgl2
         YKnPvdHXGYQ89DzWZYvFcw7/bn2Dl1qeeE0+sLTsRl+BGMyEPjZCGHQr5f2te/bd3tLE
         pVHdR/WiKSbc6cUVwAD+mrl6j/sX6YFhxEV1BnOr8rk2rtWtfQum3RRHtHX3+EcUNXbW
         QxTw==
X-Gm-Message-State: AO0yUKXV3sW4rW2n1fGFSH9ZGkyyLwsEww4ZY0d30X/jq2O8ZEeP6dbk
	8MJiItmnq9j2oHkrcA8qcu7fLA==
X-Google-Smtp-Source: AK7set8IpEHuh6XOU3Ps6rH+1G9kJdpMfhhkYJ58mn7/QBI2XD92krslfMrBgNjq21OPoMouwOXPfw==
X-Received: by 2002:a19:f00d:0:b0:4dc:537c:9229 with SMTP id p13-20020a19f00d000000b004dc537c9229mr146526lfc.30.1676901343735;
        Mon, 20 Feb 2023 05:55:43 -0800 (PST)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r5-20020ac25a45000000b004db513b017esm1529652lfn.45.2023.02.20.05.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 05:55:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] dt-bindings: google,cros-ec-keyb: Fix spelling error
Date: Mon, 20 Feb 2023 14:55:31 +0100
Message-Id: <20230220135531.1987351-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependency had an obvious spelling error. Fix it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/input/google,cros-ec-keyb.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index e05690b3e963..a8abdb39623b 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -45,7 +45,7 @@ properties:
       when the keyboard has a custom design for the top row keys.
 
 dependencies:
-  function-row-phsymap: [ 'linux,keymap' ]
+  function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
 
 required:
-- 
2.34.1

