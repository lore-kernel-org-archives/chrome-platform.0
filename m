Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9D34CFD5
	for <chrome-platform@lists.linux.dev>; Wed, 24 Dec 2025 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589774; cv=none; b=sw5PHadU5Ff95wqbaPsxXwU8RO53wlxPMP380WrJv+v8m98F+QbY6jtk2zRXxv0AiqqoIt9AZQp1gGBf8EQ6W/viwCNfK/pLP3yYWyEhepfwQpj9MAAtxEyQxN1zT9bBQNNOoziWitIOGMhH6XJd7NORS2LVZZhso0sbtNwu590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589774; c=relaxed/simple;
	bh=E76HtQ/wOlk/iTdKNvwcIKzGwEJiphG6wBguNie0bF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6k92kPfNuSWYCfiIDZeLb6eD6IDZEmQkx6YhqNVnlozymG8tLVroZgshbKN5TyGexb9lZl4zJuZSGdFEGWx5iEn/MeXvBdDwEZoBrP2mMSfs/xn23Af+B+1yoH4dWtqn3bMCYqQfF5WHtn5Hi4d+oNMiCzS9Nr1BmHejDTGNCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nt4svtMp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nt4svtMp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4327778df7fso119093f8f.3
        for <chrome-platform@lists.linux.dev>; Wed, 24 Dec 2025 07:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766589765; x=1767194565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=broTySSYLTvfYQKOi4uFtvxxGHeRyXiGXlc1qJUuO3A=;
        b=Nt4svtMpATnivIVGOoiD0b/VcBjAmOgev3wxBRiYjaIvXoAwN0TzFx2J20y34bFA9r
         nnSDLiLUovGAmczBuOXCmR/fhkh/S54AT6fmjjSMl3MXZA697XbMGjzOkf3ACo1HgrWz
         yARwXD0UnKQbTU4NUdFxy8SJjfVwnC7uKYtWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589765; x=1767194565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=broTySSYLTvfYQKOi4uFtvxxGHeRyXiGXlc1qJUuO3A=;
        b=EzNuSC57i+EFCrEa50h7o9ytExEw6B8UHxwU07Ociz6sGHjMgrVyLm9IJrw2bwR/Q8
         XEvupyW+SvJq6nQfhBZ15/CADExOn5QaAksb0bE4n4GLJ5htkzq2ULWd/DT7kMNzk0wU
         X8XguKtcGYtK3FK2wKlGwkCGt+pcfA6Ug1XSOUi5IDRIXPbTny/yiuLDV1Dv/Mkms0/r
         4L7bs8HQ6Afl477PmQWcMMfogkvzxpv5zg/S0xZkxsIpj8XY1HqHDWxmcGMMPq0wLfEa
         96LuKj+G6q/abCWkJuSekPz7bUcu+D/FyLBjbm2vvTfHszZkK3eD5scO/b7Um1VVB+oI
         swnA==
X-Forwarded-Encrypted: i=1; AJvYcCU6NKUkHBh+sQg1RVVFbEkcx9bzvif1A+OAQRGF1OFi6vGi8oQOOElbaQQ6yrhXLP/9+83MIhxH+NhC3VxPkbI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ugj/rMvRKZjajchNn/suXSWggfpd+XhcBUal1LnYQwLdbpJa
	eIRcuzWRQBKUKyceZNE+oMJYq68Qj12ps+RPWFp1PzFfFlkTA8kO5DS1v7QMrdQklA==
X-Gm-Gg: AY/fxX5LkmCc3I2vBLSyfwQYR2IdDZRSASVuXV0YEEL2bdMcM5i2dcVLxXT9iyvIlOD
	V+8HFOrpe+ZaSeHXKbKQ/3AQAcy/Oi5SeBjca8AjNqMk1uLpgT5CbnNl/pC6ABCrqYOAJCqZqVA
	TBkjt1O/BBXywlYT3ZoVCsJfj4NWQfOC4QpU/8PbdM1vMXGHJFGQOVvFl02AinmkcQWnf26JFuc
	M1AYtsMFWmGi9o1dUiYpAMovQS9s2ie5xrLDQmFSDdXlg8gcb3A5dc590o/O3xlLP1JS7x0QJxw
	kpcdY3Y/o+FeQxYbxbdjmpPmo+TFuP8clCav0MsARNbBMkJYAiNzfm9JpfFrUQ6GtF2qwp3/liA
	7MzOlX7jjBvNLoCaeiBlO8zssdsYf968VfZczTWCpsTaVLJ9AtzNy9p/6/fI6RAB+DEXpVFGiR6
	pEzBL8C2A+nmNjqU8=
X-Google-Smtp-Source: AGHT+IHB446KR9bbT+6fe4P8dhCXUz9efTM0RI8RQnUg/3RKKGMv4Zs6DxHZ83wur1VVBkRdUAUQzA==
X-Received: by 2002:a05:6000:2586:b0:431:84:357 with SMTP id ffacd0b85a97d-4324e4fb143mr21280148f8f.29.1766589763244;
        Wed, 24 Dec 2025 07:22:43 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm34307363f8f.0.2025.12.24.07.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:22:42 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add use-fn-overlay prop
Date: Wed, 24 Dec 2025 15:22:38 +0000
Message-ID: <20251224152238.485415-3-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251224152238.485415-1-fabiobaltieri@chromium.org>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the use-fn-overlay property.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../bindings/input/google,cros-ec-keyb.yaml   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index fefaaf46a240..437575cdf352 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -44,6 +44,14 @@ properties:
       where the lower 16 bits are reserved. This property is specified only
       when the keyboard has a custom design for the top row keys.
 
+  google,use-fn-overlay:
+    description: |
+      Use a function key overlay. This allows defining an extra set of codes
+      that are sent if a key is pressed while the KEY_FN is held pressed as
+      well. The function codes have to be defined in the linux,keymap property
+      with an offset of keypad,num-rows from the normal ones.
+    type: boolean
+
 dependencies:
   function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
@@ -132,6 +140,23 @@ examples:
             /* UP      LEFT    */
             0x070b0067 0x070c0069>;
     };
+  - |
+    /* With function keys */
+    #include <dt-bindings/input/input.h>
+    keyboard-controller {
+        compatible = "google,cros-ec-keyb";
+        keypad,num-rows = <8>;
+        keypad,num-columns = <18>;
+        google,use-fn-overlay;
+        linux,keymap = <
+            MATRIX_KEY(0x00, 0x00, KEY_FN)
+            MATRIX_KEY(0x01, 0x00, KEY_1)
+            MATRIX_KEY(0x02, 0x00, KEY_2)
+
+            MATRIX_KEY(8 + 0x01, 0x00, KEY_F1)
+            MATRIX_KEY(8 + 0x02, 0x00, KEY_F2)
+        >;
+    };
   - |
     /* No matrix keyboard, just buttons/switches */
     keyboard-controller {
-- 
2.52.0.351.gbe84eed79e-goog

