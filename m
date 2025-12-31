Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04A273D77
	for <chrome-platform@lists.linux.dev>; Wed, 31 Dec 2025 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191748; cv=none; b=Pa18FTof/Ro3tcxVdn2+RrxhSrcX9RobZl9c/p2FHM9UWrP9j5/H7g1MuEMKBTGaHib/9UIuvI5hIbzDcXTSYIJvJJ2Rh1ydNrlg5RXfRvbj9Im2eMAzeGUlXfvbWR8myb9nBlcwKygd7jNzmo8NawWnCSYoXZAJ7rBGd+Iz/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191748; c=relaxed/simple;
	bh=1vH4KrFv8xvMv8rpRWUougXl8BcRT5RLGVtAo9ej2xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxWCfakAFmQ2GPpqXefD1+0d6OUltGWZV0uxVStWfFvJmVIfsYXll+U8KmuxKMZOT4JsdiaCVjN+hrlEAeKRL7T9Ismx076dZ6/4DzpQgg+TMcmlxsCSnyPB5nrUEGu9lUrIR7P8c1s/k2PILJTv9YVaodiR751savpTS7PWN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eptdobR7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eptdobR7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so8995835e9.3
        for <chrome-platform@lists.linux.dev>; Wed, 31 Dec 2025 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767191744; x=1767796544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34pYk6l1cH16LeyZVvdM/XV6wo+Nk0j+m4GLCKEWRwU=;
        b=eptdobR7NSR3ZII6Ulc3MFR1njhSOeHg8dvdegmdwb9yU93GcwV5eq4pcPzsgULSsn
         8qj0HNbqNSt7ND5qOMncbb0wx/RaheHZr+3Ig9gQdKRevFKxGUlSEovhYZcb9H8toicn
         XqQTSUmFD1B5blhNw46OC2YJR0UMj1OixgxoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191744; x=1767796544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34pYk6l1cH16LeyZVvdM/XV6wo+Nk0j+m4GLCKEWRwU=;
        b=w3LJPiYStWiFhlTQa6LXionTp3bebqNECaboCdJLmZWcMw+EOWC2FKIAB1CVGxNloo
         cJRzlC6Ln4jFdHooIz5rW8G+PJ1OTY91HP5578B4oYzAZAChF//0kOCsAEtQMBFglAOE
         FarncJ95+tmGP4TArKU3FekA6dCgs9S5GJrOhH9fP2KeYyMt2GzoATOXMIOsU61P9U0P
         dFjplz3RvpXliRiE4g5Jcl1zso3jgayKtE+j9SM9ZT8HMXfj/3Ka+aChdtSGZBXQXIXx
         m6sz5KQiUxrzjxsGTq+DPK+DapdmSXhvlIDbMawcKbMXEDAtEF+zRqPICeWalwXAkboG
         N9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVaGQwg9M0jwuifjvZ/PRHpzY4EMEhAMkQ+mBMVA8INxaJ5hwQ0rQypBRCGsHBpNa8loYfx5Vnd9+0j3NdRblc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNWLdH2Zq9sxbyF9AtOnfZVwk3KkCH+77no+VM9TpclQIcWsOR
	loDQgQwUJ60H5KA7ALpH2fDqKxystac4eK+DToawR0oywoC93FuxSUODEqrSGYyBXA==
X-Gm-Gg: AY/fxX4bGmqz7um4XZ5jrPoRSEuMDAgCiC9AUbKQMCKaOoqcv6pZ/2G1GZYMzrcz5yV
	L9EySFUfqABleAOBAG5ws1SlFvIB+aU1EJaMUNFDEbhqZyTy19GgrXskxw14+2wmcMiEhZ+R7q0
	d614zPQF0f/GW71tgZN+Bwjh/CnkeGbg1VTcpTF2bRLNzt2rQCMtUffTrR2qebCp3InQ3eErix7
	v/z6l7wiAcHkK3MA2MXmrdua/PLIhFLhp1QD2JKBGCiCXdrP/T1M7HA7IQBQxwLKx6vLetOHuLM
	YW6N2wg7X8p1t8Hy3kIN8AbGA8T7d/Z7qh7dUzf22a0jXvllYZKH+b+4xH0F0VMmo+YBQMTWcXk
	FqpoGwNGHxB5kq+L1NDuoIF42i2uZQQWaz0Yb0luKOsO5iN7Er2+vIxyk5iaqqRPJNDhYKiUgk4
	5lL8nvPR+cAN16cX5ejaW3V3COnw==
X-Google-Smtp-Source: AGHT+IEiRq6V4CAH/S2a6MvgduONiJuKUV1PONniN7Ix1f5FJkAX+d5WlgDqPZJkgHzRkh3uELoZxg==
X-Received: by 2002:a05:600c:470a:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-47d1958e43emr342849195e9.37.1767191744550;
        Wed, 31 Dec 2025 06:35:44 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm630300935e9.13.2025.12.31.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:35:44 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: add has-fn-map prop
Date: Wed, 31 Dec 2025 14:35:37 +0000
Message-ID: <20251231143538.37483-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251231143538.37483-1-fabiobaltieri@chromium.org>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the has-fn-map property.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index fefaaf46a240..fa24b1cbc788 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -44,6 +44,14 @@ properties:
       where the lower 16 bits are reserved. This property is specified only
       when the keyboard has a custom design for the top row keys.
 
+  google,has-fn-map:
+    description: |
+      The keymap has function key layer. This allows defining an extra set of
+      codes that are sent if a key is pressed while the KEY_FN is held pressed
+      as well. The function codes have to be defined in the linux,keymap
+      property with an offset of keypad,num-rows from the normal ones.
+    type: boolean
+
 dependencies:
   function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
-- 
2.52.0.351.gbe84eed79e-goog

