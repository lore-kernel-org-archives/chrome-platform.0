Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB1D317164
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255660; cv=none; b=hN7xAz8ygwqENJIv5iyrTCtvpBhbBjPA4/pR/R/cZ3GeaK+O0eLDzh9uIOtNG87kzGJKWELlGDeRBfYqpRU0nQBtPALTH4ZVXUU603Xc3+77aU3yPlIGsth36FDgg7VdrYRHVX3ixNcoMQiWpPuR/XsnIiq7f2wCoqEAMWVeZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255660; c=relaxed/simple;
	bh=/mbVbHwfU1OPBxftQbuqd+p4EqiF4kncyA8GPaZAnDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wv1e+/CtQYnab1XKoMCc2Z5s7oo4+e4nnTi0sjmwYjiGUVvxadJKlNv0T0bkr1/P8uEyYPAiHXmjgZw7aXDz4MGJ02hyPSnm9Oo2eNA+NiAg1aoN0knzjNkK8M99Lw6whobFEozoCUmvgvKKQnOrAhwAryaTIjY6LsdIOrr0C2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XeMycPfD; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XeMycPfD"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-127133794b6so3488970c88.1
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255657; x=1775860457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrqOiGLmU/TqfB7pUyMSAKDJK17fNSdE4/EVerFbIPk=;
        b=XeMycPfD98O2D7Lt6C75GkKI9YOb2k+MKAtiJmOSA3oJmpMCOHz3Px+rl7+Dync+AB
         kOknPUMLdhqdrzfv1MyMkm20u3SrD+2/Ce0FhOTqsNJwy3MfZjC8bBeDwzVJpdI0RQld
         zsv8mVNbJ20Q/9Uh1jZZXVv+Q2IRldD9CAWpf+d8Soijda5NJxDbSp8nzR/aClTIrKeY
         I2EcvLQqH7E9YtfnSbUSUOF6LhXS4oCqQxu3CDOANKXgC5qEqytgCO3GnqEIhX3J8oIA
         /yr641J7yG8xntaOfcC47MTSrG5HLWgxAgIOVfShXgQdq2EUHMpVevoDaD+yrHZpweJQ
         3Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255657; x=1775860457;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UrqOiGLmU/TqfB7pUyMSAKDJK17fNSdE4/EVerFbIPk=;
        b=JQ2X6G3MBlpgA/Czhub38X3rbB0PonP/Bt9zvGomRuvxd1Nal+tUjvDk+rkt0wlSkd
         JZXEKCB216TtVACM18908a/0ViJoaECY0xZ7CcaPQYoOGJqlWaCSVBkdKiOEcFLH321o
         4DfQVtDUX58UpO+a/UnpPQdiQlzIgWQuovaoU6Sdj+pXc98Me0XFdX+WPx1PxT+XMoEE
         nLGue8XVeXijxL76TTGypXsUmze4ft02R+UiIvltJvoad+HxrGbr10BiIiHNvTSxnN8P
         CbCJf3c6gb0CBr8X/cwOQeqQko0L/CSgsl+bemjCCWmyzLF2YBx0HAdGKprV9Y2xVtin
         DewA==
X-Forwarded-Encrypted: i=1; AJvYcCVnysZzP2mb1ONOsA4ywNdOdsqWHLnZ7Zd8ogzy5X8OMVkMa/01x9A/h86AnCZGiZBnNgTk4j6zGcuoQxNf5kA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhK6rTKY/h5mVT6aYH3O0olY1OzvXBTXWFfZIpKtEl25/sd5I0
	zt596OLNfH9LoQXA3MWD9Ohqu99ryIITKYHUcyi3OnnDcIAuE1kghouvewh5nr1/hoe3rw4Q5bX
	n3rxpew==
X-Received: from dlae26.prod.google.com ([2002:a05:701b:231a:b0:12a:6b88:b9c5])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:43a8:b0:11b:9b98:aa4b
 with SMTP id a92af1059eb24-12bfb6ec461mr2298676c88.6.1775255657105; Fri, 03
 Apr 2026 15:34:17 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:26 +0000
In-Reply-To: <20260403223357.1896403-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260403223357.1896403-1-jthies@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-2-jthies@google.com>
Subject: [PATCH v1 1/2] dt-bindings: chrome: Add cros-ec-ucsi compatibility to
 typec binding
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chrome OS devices with discrete power delivery controllers (PDCs) allow
the host to read port status and control port behavior through a USB
Type-C Connector System Software (UCSI) interface with the embedded
controller (EC). This uses a separate interface driver than other
Chrome OS devices with a Type-C port manager in the EC FW. Those use
a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
compatibility string to the existing cros-ec-typec binding.

Additionally, update maintainer list to reflect cros-ec-ucsi and
cros-ec-typec driver maintainers.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.=
yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 9f9816fbecbc..fd1a459879bd 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C po=
rt driver.
=20
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Prashant Malani <pmalani@chromium.org>
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - Andrei Kuchynski <akuchynski@chromium.org>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+  - Jameson Thies <jthies@google.com>
=20
 description:
   Chrome OS devices have an Embedded Controller(EC) which has access to
   Type C port state. This node is intended to allow the host to read and
-  control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  control the Type C ports. This binding is compatible with both the
+  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
+  supports the host command interface used by the Chrome OS EC with a
+  built-in Type-C port manager and external Type-C Port Controller
+  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
+  System Software (UCSI) interface used by the Chrome OS EC when the
+  platform has a separate power delivery controller (PDC). The node for
+  this device should be under a cros-ec node like google,cros-ec-spi.
=20
 properties:
   compatible:
-    const: google,cros-ec-typec
+    enum:
+      - google,cros-ec-typec
+      - google,cros-ec-ucsi
=20
   '#address-cells':
     const: 1
--=20
2.53.0.1213.gd9a14994de-goog

