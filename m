Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07336151992
	for <chrome-platform@lists.linux.dev>; Wed,  5 Feb 2025 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738798224; cv=none; b=ljWJJ0GM1dQZx4qIPXg/o7Jkv/zsU0LU64DHAyU3dv2IWBagR02FJ5WNR4AHdV2qEOzOXLePdeHEyTR2tf4YRzH8t8akMfRASvD5GbJn7I0qS4iDQNh5KfgQENkUiDE9JP259LJGx44fwZyy6rxL1nvfcso4ubmm0odYcwkKREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738798224; c=relaxed/simple;
	bh=w0KqSvz4LKHnh40uBElw2aDPtTJnsxo3kIyaKh2DPsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUkex8+BNn5rJSvYB2NnY5rDboMu1uU8e+u5GwV+ahgc8aAT3osC8I1DIPTXJQ7bMIfHzuqOKHb2AY7vzUUagpEGTRYrGIK2EKj8Fa2EGYsNU/KerKNm31Mxi3rSJrz92dB4/OrNgREIbzWL5GQ+ODaKNoqOGLjrVXoqltmfdvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mBx7DZ1I; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mBx7DZ1I"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21661be2c2dso6987655ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 05 Feb 2025 15:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738798221; x=1739403021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfrhKTgFStXH2HCRNCmE3wFhveRGNarb8z2r9ekUmYk=;
        b=mBx7DZ1Iixq1innxTTH4teUeFZlfNGWzail5F2c7hQZreiqnuBlGKmGZ3px/6/9u0C
         Nhnr/Nfzsgbzg18lL16K491tI3lc3PCvYHSnDi9Q0O0hpzub0+xwMQtuacR8v/5o6pjW
         zZhhSrDJq5a4mQY1Oy7cjk4SyJAt/Zk0d5+lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738798221; x=1739403021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfrhKTgFStXH2HCRNCmE3wFhveRGNarb8z2r9ekUmYk=;
        b=owPcoMIvrC4eHAeifQVBANopxo1DbrkM36RnlFgyePXTssTzyex6iI5xCDUglkrxIO
         T4wk+pcDMni3mCRLC72Cc0H0hHBKPmk51gYRdpx1Fza7fsHOSd6gwTSsZVXCEc44UhsZ
         7aCqARVLY6QodRsG99v8AWZiuNHN/FZ3EtDH4gf8Q65H8SrAJziAgfGzZCKDtxNccrrU
         DuYe/6z45JIdROrnOV3MWvOUCkbDEWoB9cqo3kEF+Iws+fEUOlY/3ghXHOjWx7NmLtUW
         a5jUc0S+Zzth/E1HtgFmziebA2mhvxvUAxoTI0AcKzHrKV6jSnPN93VvsY45wXUqtOh7
         4MBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3H+vZoSGa6q1msGqwGMnZIumhrd6S8tfP7QWy949G3U7DidAEn6p7DKANkPP5D6c7A5AkDJNLhp8bKmbv6Gg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjXA3slvHEW2jEx0U8u2KF/8zGnPGD2HXPTo9TKdJvMdY+YEsc
	skhB91oBV9yLYQnKAp5XDa8koNFoHbuQMZ+eyKS5xgvoL0TA6d+mahmfqdI7fA==
X-Gm-Gg: ASbGncvfANOHFFNjSUamwn/ifgwVj7hE7QvO2hNlpcnUhKAT65uW4MtF1KyUQlZjhwh
	dfcBJ90hY4rDCNhx4KC6UGT3hXSDuMDa7770h8/y2Jslnz+LM4TxMIm3Sl7yet9djFY/Oy9V/ZC
	HYJCXhTxYMILfujX6UG9OIMCyo6gcc2zTY9U4s3vLTdNyohZAg7HfvMu0uoOFqwMKv6pFvLlKHk
	b+3VdCPdshHzhdL9F8TzEMxGnkSD/P4t+uC63gVlFWJrIF2PNwqKfzLSMbfFvVnjEafeHF20Anl
	SE/UTfOUaKCzogpIBj4I2r9egCPlHeXHEUqCKqG0/O2PtMbxC4HbxcQ=
X-Google-Smtp-Source: AGHT+IHUo+FqElUk1sltTHIWznB6GdIP99OTajELLS9rXgQ0/Ee3VmZ7ONPYnmSuxZTKWCv2pLwwGg==
X-Received: by 2002:a05:6a20:3d93:b0:1eb:3661:da3b with SMTP id adf61e73a8af0-1ede88ad4a8mr7472061637.33.1738798219826;
        Wed, 05 Feb 2025 15:30:19 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73048ae7f79sm15435b3a.77.2025.02.05.15.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 15:30:19 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	cros-qcom-dts-watchers@chromium.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB
Date: Wed,  5 Feb 2025 15:30:13 -0800
Message-ID: <20250205233016.1600517-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wiring up the USB hub to the connectors allows us to gain the proper
'connect_type' and 'removable' values in sysfs for the USB devices on
sc7180 trogdor devices. These two patches are split off of a larger
series[1] so they can land faster and because we've come to the
conclusion that the DisplayPort path is going to connect to the
cros-ec-typec node.

The first patch adds the pogo pin binding to describe the detachable
keyboards found on some trogdor devices (actually strongbad). The second
patch is the dts changes required to wire up all the USB stuff. This is
sufficient to set the connect_type and removable sysfs properties of USB
devices.

Changes from v1 https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org
 * Split out of larger series
 * Added description to DT binding
 * Removed DP part of dts changes

[1] https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: <cros-qcom-dts-watchers@chromium.org>

Stephen Boyd (2):
  dt-bindings: chrome: Add binding for ChromeOS Pogo pin connector
  arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors

 .../chrome/google,pogo-pin-connector.yaml     |  68 +++++++++++
 .../dts/qcom/sc7180-trogdor-clamshell.dtsi    |  21 ++++
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  47 ++++++++
 .../dts/qcom/sc7180-trogdor-detachable.dtsi   |  15 +++
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  47 ++++++++
 .../dts/qcom/sc7180-trogdor-kingoftown.dts    |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  55 +++++++++
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  44 +++++++
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  31 +++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  56 ++++++++-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  47 ++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 109 ++++++++++++++++++
 13 files changed, 648 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
https://chromeos.dev

