Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E3B2DECBD
	for <chrome-platform@lists.linux.dev>; Tue,  9 Dec 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295238; cv=none; b=LdeA7seQW75Q1Fc+OGuknevtGkA9vn3YyY6Fb+AaBzdZK4SdG4igIodARDrzNDzfduB639k0dlJ5J85HqUFQVMeMS2qtaUSkvYRQHoFvCwhFaPZBkdHCIFuKkk8m1l384xMr+BURoIKJIXUm90IOmH5hLf8Eiwu2CyFo5Wdb8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295238; c=relaxed/simple;
	bh=Mf0n1LHXScTwDCBqeKr4+XmfEBe8ouhRSTBuNlOqDjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0KZf2j7kvnR3jigfLKcJqo3tuqhsfTnIjhRslIbQD/ubjKuAmxuZ8tmrXzVUUt21uAvVXgefYQ8ElY931M21lVDFNSHiDmmllqS6SESMsh7M9urRbbkf8OR0jkDw8L27nqsm0lO9wYctScmTCagEnfJxf6mH8qaKVzJFj1ouL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AIc7KUaM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AIc7KUaM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so54976395e9.2
        for <chrome-platform@lists.linux.dev>; Tue, 09 Dec 2025 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295235; x=1765900035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddxV9ehu0GXJ9iiWNjTlWwirsEs0puBXrIAVzil+rQM=;
        b=AIc7KUaMsEr5h7uiCmxXf1PlAAaFLQ/A8FaySyndZyIGsVlB4O6btOM2OEE4OuKd98
         lqlfUXaAVDbAIYsTbIEn/6OpY/v0pFkdPsW5ZTOOXqeaE0kDwfWa2fCd7v3yUvPiNbUf
         ksFeZwrQgHdRg1lKiiM1+JqfTc2uQd8UyLme0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295235; x=1765900035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ddxV9ehu0GXJ9iiWNjTlWwirsEs0puBXrIAVzil+rQM=;
        b=E3jkUYtFSbgcoKP6AQyJFIJf8OphP8vutI4dmDL7no9N8DFRxGHthiFai4lgM7HXab
         aMBRfSKMzcamT5TXsgZ+ftMKVj2ixg6q7au2vZBVwNw3vHyhmxpQI0w5ZdmJDp/kaap8
         YeCACehiB9BlwabeNDglXjhIgoLznn6g4fwihnbaeMgjYYzI4VLJ9F5tnsFgDhEaMVds
         07S79Q1m+6SSJKjICBIkG6/Y2TIQxZ1RIsHdYwB7z697+Xyh07WsC/WR9vSPAoElEguy
         HwG64UcwmulRZ6lRD2ldP0c0teRulghAbLNkWIjpNUO/j18vaeD1cOBR+zT7gu0E6FF/
         EvBw==
X-Forwarded-Encrypted: i=1; AJvYcCWS4e7ckdke8o+gGflfwnfGJOmIIloTahOqK2ELuG9O1l7BoTPp2l4tXdDKyBljTIJoUDtCK3WPvEY9SMHBz0c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQc76ifFT9gSye2XKTycPSnpPfQnOVUsM6ZSU589NHgZT44pQv
	SgpkTGuhi1KrAageMybwg25+ePtvdkawVUNUV+PlWD4AByUy9rASQXfI4SzrpOzQmQ==
X-Gm-Gg: AY/fxX5JdTZ3qAThlKyuFPqTlePKbCQ4tjDZVW0xHtmqwDNtE8vWdJ6UDoBW8bZ682f
	uVjKHWodf9dPLKWojiHrBnXxBiyu0+seLZTQkhLABCkIBvCyh4nfCYE5dlAkBI/vmeUmPPVUnDD
	VkRZa13IV+uL6Xz+o+/cauKTPdMAI6lpw6wUqSWsarhRu5fzDw0EpsSV6eUFpoa6gaULK275MdK
	3t75Zcv8mgfzZvu4LPJUJnjY1Qlnxf0CNeOPX+x3DAI97aX1VYbb6yWxqY0zXK/s4A68qgwgK2n
	HZw3Vd9ofWx8ynRXs4rdeewl4iEKTpFOmTuqA85IvlgNaeWHAM6Z+8gy1t23ZF+maDF1ti7tE/p
	8FI1iW1aVVXgzu5F/+VsK7A/5L7HCughNZrEaasjmfmb7y3JIiIdfRcp/x2EbbgfDfQ3RZ31RWl
	hsVRAe+zIZ6sPPza6MAAtLJOpq8Q==
X-Google-Smtp-Source: AGHT+IEKi6UxypeqPOH+18lDVXZJpB4iIoiaagxsyYSesPihG4eCl/CaHPqW6Gig0ydpspXkZ+fjYQ==
X-Received: by 2002:a5d:5850:0:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42f89f6e838mr12441377f8f.53.1765295235028;
        Tue, 09 Dec 2025 07:47:15 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:14 -0800 (PST)
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
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and f-keymap props
Date: Tue,  9 Dec 2025 15:47:06 +0000
Message-ID: <20251209154706.529784-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251209154706.529784-1-fabiobaltieri@chromium.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the fn-key and fn-keymap properties,
verify that the two new properties are either both preseent or none.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../bindings/input/google,cros-ec-keyb.yaml   | 60 +++++++++++++++----
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index fefaaf46a240..56adf9026010 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -44,6 +44,20 @@ properties:
       where the lower 16 bits are reserved. This property is specified only
       when the keyboard has a custom design for the top row keys.
 
+  fn-key:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
+      col, code) macro, code is ignored.
+
+  fn-keymap:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 32
+    description: |
+      An array of u32 mapping the row, column and codes for the function keys,
+      use the MATRIX_KEY macro to define the elements.
+
 dependencies:
   function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
@@ -51,17 +65,28 @@ dependencies:
 required:
   - compatible
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: google,cros-ec-keyb
-then:
-  $ref: /schemas/input/matrix-keymap.yaml#
-  required:
-    - keypad,num-rows
-    - keypad,num-columns
-    - linux,keymap
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,cros-ec-keyb
+    then:
+      $ref: /schemas/input/matrix-keymap.yaml#
+      required:
+        - keypad,num-rows
+        - keypad,num-columns
+        - linux,keymap
+  - if:
+      anyOf:
+        - required:
+          - fn-key
+        - required:
+          - fn-keymap
+    then:
+      required:
+        - fn-key
+        - fn-keymap
 
 unevaluatedProperties: false
 
@@ -132,6 +157,19 @@ examples:
             /* UP      LEFT    */
             0x070b0067 0x070c0069>;
     };
+    fn-key = <MATRIX_KEY(0x04, 0x0a, 0)>;
+    fn-keymap = <
+            MATRIX_KEY(0x00, 0x02, KEY_F1)  /* T1 */
+            MATRIX_KEY(0x03, 0x02, KEY_F2)  /* T2 */
+            MATRIX_KEY(0x02, 0x02, KEY_F3)  /* T3 */
+            MATRIX_KEY(0x01, 0x02, KEY_F4)  /* T4 */
+            MATRIX_KEY(0x04, 0x04, KEY_F5)  /* T5 */
+            MATRIX_KEY(0x02, 0x04, KEY_F6)  /* T6 */
+            MATRIX_KEY(0x01, 0x04, KEY_F7)  /* T7 */
+            MATRIX_KEY(0x02, 0x0b, KEY_F8)  /* T8 */
+            MATRIX_KEY(0x01, 0x09, KEY_F9)  /* T9 */
+            MATRIX_KEY(0x00, 0x04, KEY_F10) /* T10 */
+    >;
   - |
     /* No matrix keyboard, just buttons/switches */
     keyboard-controller {
-- 
2.52.0.223.gf5cc29aaa4-goog

