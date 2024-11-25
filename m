Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D52818C337
	for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 08:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732523494; cv=none; b=kTkVd5E11mxt+pr28zE5GhXzamqIWaoscIR/QQemONK0MhdlNXs7EVIF8IfXZ0TaC+JkD2Widc90LcMHDdhacvNv5SgZu0PLvxfGJWC3N8MmU7Wnky0pY34BAtChWurFPMpHc6GCsRHhhlLd3jomZrqro462bW81uXdjOS06Rnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732523494; c=relaxed/simple;
	bh=ktJPK16HT87IqUYNk6xW4DxEM+thEREPtW8kVjrlImY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iR/7YNlKYu2bdFlqj/nrpysru/82tfYNOc1eBcHMMSMLYYyQBuzez2wdhCjkDhJK2r/ECFXrmD6RKVG6l5p/ibZcwVxnzzN3cHzHNQxjxxBM12geuGqfUQm9UE+xllhDWCaouuyLnPxdRnE6stR7Q8SREJ+7cfFtSDIoGMI6l6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m9M7P/Rr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m9M7P/Rr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21288402a26so37629915ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 25 Nov 2024 00:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732523492; x=1733128292; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POCxcDAs1OPhEdapqaVu7R6Wv3Kn60gIQbQM6aiBFqA=;
        b=m9M7P/Rrwp8K8JONWYjoFI1CocjNxDF8newT0oQR3z78cEtwFpdFi1776RXWyH/oIH
         w5T7UlmGdreoWp8fLnnNSkiPy3Xg68GzrgEyChMnnzxwe465T4GpK2JadXstmBW5kJa7
         VUwPRi2OEKZmlICa/e4h0jzTifvHqb4TzdRQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732523492; x=1733128292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POCxcDAs1OPhEdapqaVu7R6Wv3Kn60gIQbQM6aiBFqA=;
        b=FL7NaJnH2xySX9R+2Xr1rfE53lZVyc5BQeHCraeZ3yPqiGHofedPHkX+QfjZeoxdDJ
         3J5Ei14js1YgT0ahgf42cfw42DRfmkKRg5kD85EAHOgvBcSWLOnLl8hz5vUXmFz+2FE/
         DxNkYfvpt3ddwMyVBaYweEjOuueu3Ztnsz75cytKCHcXavZjz9PQgk/qr3QBIibJ+kii
         MEFFJzV2deqe9lFrZiW4JCX+efAAZMDKz1lTf2rG4295KnxoUJ3eYMBn+8xy7DnOfsEG
         3JB+XucEFcOcHBIi51PcJ26ABogatPUAQwD0SQKMFCYyLLxe1RJk+ryCy3lNIbshFYpn
         Wc/Q==
X-Gm-Message-State: AOJu0YzjECUBSj3PNenufRwckD6H8oQYKI59SwMchysXAbFUxA9ifYB3
	9JKfqNmECMRDbsGpFtK6ybP44CPOHmrMdx1MlnL/M24bHHFxbUMjCG2wTNjo9g==
X-Gm-Gg: ASbGncsZSxYjAYN/tQIf5OiVYSorNgLUggpBIwWVq5KQ15jeQt36xKTF6sem7wY9d2i
	CCJ9OZWQDjepJfXod2yo5rvVvOKahtA6tkaVnPmDVKaCLUU43pkMz9t0udD25f4X3kglFwv83GW
	Co9ti1UqT8jW8Du1j6QIKLQvmSrNT9RvdbFxPt40ZD8kW+ppgGr/O2EXSQC0yf/Rl3ydklXg9dz
	nZTRQeVLCEGr+9B6YDL8HL5xnud1nIT8HE7CQQu94WMbHcn2b/7agwN+BMrb2IZyvsPU6+D
X-Google-Smtp-Source: AGHT+IHSb4l363kSqeAiiJcrwoOGnozawSDBYK+oCcUIkkFt6/AtetpUnMMRtlfX7k/Ckh1KEU4bSg==
X-Received: by 2002:a17:902:f685:b0:20c:9326:559 with SMTP id d9443c01a7336-2129f240de5mr179893455ad.29.1732523492519;
        Mon, 25 Nov 2024 00:31:32 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:66a3:d18f:544f:227a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfece2sm59090025ad.157.2024.11.25.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 00:31:32 -0800 (PST)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Mon, 25 Nov 2024 16:31:17 +0800
Subject: [PATCH v2 2/2] dt-bindings: mfd: cros-ec: add properties for
 thermal cooling cells
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-extend_power_limit-v2-2-c3266a86e9b1@chromium.org>
References: <20241125-extend_power_limit-v2-0-c3266a86e9b1@chromium.org>
In-Reply-To: <20241125-extend_power_limit-v2-0-c3266a86e9b1@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732523485; l=1439;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=ktJPK16HT87IqUYNk6xW4DxEM+thEREPtW8kVjrlImY=;
 b=FpMKgfM5p9IzbPe7guqbp4Vjag/aqYKH4JxQjr2hWl48PN/wyJux8YdE/6fm8+fY0+2OLaW7c
 ohiglj075PQC4cCEHOJcL5SCqRAmB2aBhq+byXp6ug7DAA8KeGSGApQ
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

A charger chip is connect to the ChromeOS Embedded Controller (EC).
When external power input into the system, current would go through the
charger chip, generating heat in the system. The EC supports limiting
the input current, thus reducing the generated heat. As a result, EC is
a simulated passive cooling device.

We cannot reuse the existing charge managing mechanism in the power
framework due to:

- The power framework requires the charger to expose its thermal status,
  which is not a supported functionality on EC.
- We need to use different thermal sensors to run thermal control,
  rather than using thermal sensor on the charger.

Add the property '#cooling-cells' bindings, such that thermal framework
can recognize cros_ec as a valid thermal cooling device.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..2b6f098057af 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -96,6 +96,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  '#cooling-cells':
+    const: 2
+
   gpio-controller: true
 
   typec:

-- 
2.47.0.371.ga323438b13-goog

