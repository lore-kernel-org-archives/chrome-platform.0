Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1211DB124
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776238; cv=none; b=ed0H1Y0qM9ncnH5AK6Ua2OuLrhalvxRBBQCIE+o9sUS5/XA1+qaV9YO25siudo6x+vuGjiV9+soBhUtHK4c3ZnXrHRKpUW3ko0WyUmleq+pjkkrN87RGZk7K4cFtK5vkEHaZIhw5X2YqBfzPCAgWDGC0ll0ZchPAVh9vEy6Nfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776238; c=relaxed/simple;
	bh=3DmkBeiH+EVYQGbZv+HVXY4sUC3b266LNBE6ycsAuV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dM7+uDj26gx+Y5G/2BkEbKljf5s4DjNUvvk6RpZnaOt6j7rYY1PvKd+KtgyqSJKIS46FaPMR9SCh6woZgel4EbCwqsZ0SJAVQnmWfA8XSM0UndD2g/9RLT9dUijZ81JUy4d+302VS8eMiMyLnPopMLa/19ApeQpiBLVS3pcjZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZrZu9cwa; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZrZu9cwa"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2feae794508so9915336a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776235; x=1742381035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=ZrZu9cwayDOw7YjG9yXeRQEv1y3jsDqKCzx0WKIsBACv0YAnZqvREO0Dmz3OGROykq
         Hh/aNdAMC6ivUWTJmlTe1UAnEQMvK9T3ke5tP5vNCCJvbc2U/xEJ4C9rSHl503S2UgbN
         F4nvqgrzzUodk1Ev/PDzu7+07bFJxzdmy8oeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776235; x=1742381035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=Xbi8luVZr13KTPAFYrY/Q8r8t93m20BCr53iC/GI4aD/AIaMHNZQPCqVxLKi9+bmO9
         zgQ5LvM2Sg3nCPWOrxFYy2vWC5KOLQ1rF0VflZJm6rlixgMp6HNBOiVwIFsjDEJQp9Tk
         xyvqoSNSsHiPqrQYc0MSVHr8oo1BPWIjvHvwW+l4TvoHTD9nN9r/+v0cppobcKC6EVde
         4MtbReGdfyamh8gYmD1lneg1wdEzvldxe0rjK1Bo3NTIaSDMSL6zDUbTsEEmU+wcW6FH
         qpTkYDJxGBjxm1qYPXA9Cq2PMEgivLWqAAOu1bLgdBFRZTowIUOHUZ8CUC3FCekFLBKD
         wUcA==
X-Forwarded-Encrypted: i=1; AJvYcCVkIE4F9IMSvl4NiOQm3wVXXvP4SDXFLgo8CEXighjAWlm4tq6uZVL42L0N3MPVmU1qTv/JkL2tutpd4qkUkL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzARrFisrenF18FAMzxfbI4zfIEWEw8mKAPet3G1N1AEc5BwK5j
	k0ttmVW5OkYWMmc9ehhdwTQlz/MKqvPB9eFLHSpoUEs9FD0/l95bYGWlOgAt4g==
X-Gm-Gg: ASbGnct4JSfcly/+hUrGvi0i7x7yjmQWLyXdpD5+eJ586m/Rxp27Xg4pOmN67/SJp01
	ag8qFcRVszvYqtjxOvCWslqEary0y1EjeH5qFcnTcZ+drlhrKmnJhOZdx29jCRq2lANjh+GgtOT
	sCl9js2PpuAriRBOjUTr0wsmNFl6LO3BjF0OvbiM6k7NFt/w5W1q2LJCod0mmXbrY6U373ZCUb4
	Wt+5Z9SGWoy5MKmeLjPTB7wWncm4aWBG9qB4VvYjIOXCafGnSIdL+0JXDQcnpLdAs8J0FG8zgZf
	Fu54s1pqgEageVHDXwLunYGekDRyR9zLs9EQuCpHP5/N3zkpp8jHooov9yCPY3Cp9kKdDtOEvg=
	=
X-Google-Smtp-Source: AGHT+IHVXoxHlRkSlosQqT/eYj9vz6fvVJZ92k/ncUOz6qh5Nk9iYgHkhQ9d0PdxTZIJWqbKDgo8qA==
X-Received: by 2002:a17:90b:2d83:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2ff7cf22df2mr28755341a91.30.1741776235345;
        Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Wed, 12 Mar 2025 18:43:35 +0800
Message-ID: <20250312104344.3084425-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration. Enumeration and subsequent operation follows the I2C HID
standard. The eKTH6A12NAY requires longer times for both parts.

Add a compatible string for it with the ekth6a12nay one as a fallback.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..81c391952ccc 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,18 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - enum:
+              - elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
   reg:
-    const: 0x10
+    enum:
+      - 0x10
+      - 0x16
 
   interrupts:
     maxItems: 1
@@ -58,6 +64,21 @@ required:
   - interrupts
   - vcc33-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - elan,ekth8d18
+then:
+  properties:
+    reg:
+      const: 0x16
+else:
+  properties:
+    reg:
+      const: 0x10
+
 additionalProperties: false
 
 examples:
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

