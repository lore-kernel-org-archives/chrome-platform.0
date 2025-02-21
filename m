Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03A2010F2
	for <chrome-platform@lists.linux.dev>; Fri, 21 Feb 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740180686; cv=none; b=pP15ML9scbwNt4n377pbMwmKLgfz6kzjROxp0YZYikBvYUiVhaXij6XZCHed1grXOszIIkQ1kmeAbgFJ9p4a7bH5v7VWRsNqqYebFtDmIK0+H8AiAdLQ0eo24QY1rEp6Btyh/XmsOQVTfGSKqA7IhNojjCd5Oham/OqObWA8wcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740180686; c=relaxed/simple;
	bh=f51eqVy7xwWHEuczDtwNNkEGNpGXp5mse0YoxqxxuSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWD0Ww1uOXUJqJEkairqwmc0Qopy31ye+37DgzGZrdu7AXVQaoqpSs0IlOUjmMHUpWhLkhZRJNNdiQZQotId9fAaQxKDm2quVdDoeX/4zarJDxqyNrS42ZVKqAVhDjLo5SKopQDXBMQ5D4q4rUQ36U+wmOR3aF9ylMffcbESHB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A76+NkXZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A76+NkXZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2211acda7f6so59514795ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 21 Feb 2025 15:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740180683; x=1740785483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=81FA3e/JZjjDAMLf5iojUcA5/pLMU3O5i7ad+AEyuhI=;
        b=A76+NkXZLniV508XzpQhH/AlFnT80F69OuSMmxAPn/jo2qiBIYzqAzgMQi4o4ERtMS
         3fg9H97XNxbYmsLhfouXQgzXFk4yGZPoN3aDPG8oNY2WS2dHuWdUcqZumHZqTQCQIKN3
         06QTPUej7dnP1shbqKbPEige9WTJK1oC6/Qv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740180683; x=1740785483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81FA3e/JZjjDAMLf5iojUcA5/pLMU3O5i7ad+AEyuhI=;
        b=iPCi2lJGEVy2rwMfpyWODGXFeg7388NgGu1sOkSes2h/j3/yhTCfIPU4+Bq3feRV78
         mp3GLGAV58bqCWywJMkuh9mYTUJrNWAZDECxylYJIIKsFCNv12KST7Q3A1tBaDSOMQ6Z
         yKNEJ8hCkz0CGoxAnj0NgY0EPlRTg7l9CBAUsL3EbqIIF/H9LkzzPDFwA95E9VwPgQ8+
         knDUsId4mHv3omZ20tzxQNn22y8AoFVInM40IGW3VA7NQn1+S7jpJS8yDEIYJ9896KB5
         GIvsskZY2TvFE7zEAAZADoIo6XbSU41F8NnMWz2V26b+8+t1V/h0vUDwW6pBdFgLHy0M
         wtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqK+Fh9Tpb4p/g05/b4ne736FF94dOmr8KFJUKy/HmVBDswmDye5/TCcImDYDPtyXaT/9pSPj6ZwLBSdbnTks=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt3Z74Q0Jk80c1LPqspZC8+5AVbbXUgTs6NugWjXUVQu05PCCm
	sDPWZ+9zJ6tMzQdxvFOphrnrl0Bt+g2Ng88XgibltAbe9qf4S5ppxPFKT6calg==
X-Gm-Gg: ASbGncvbzZboiBU7H0gbtkBhx5Ybc+WHtpvmyS9NToDrXwVaBGZ4CJSjINfPP8zExYq
	ZWqUWyhKYy8oLfWhDk4c1YQcwwkiwDE+GhUYpo8c+tMrvjtQTP7q8aFmP2K2LG3gsIZsHs8cALe
	wzWRxoLs1nBVzrWzziYoEQP/lw/cA9AtAwhNL4ixfsauTzfrN/bhFdF0qvJsCLZ9ZtcyuyO3hbX
	zIU1H2XRiDAcvaor4SDetGvW50cOzLxHnVZ9KaOEiOQPLN53whaG+dMqTQUhUnYSv/Is7G+wEo6
	mRPbJL4mTBoVnovVg/uCF0TaQPqXABw7ui1st3ktByR0dN5O0Y9+CAcM5MvoiJh8dQ==
X-Google-Smtp-Source: AGHT+IGkH7xMxeGNr82l2STxZJtAA8Gv2n4NyOTr4CeAZCvwgPvVhf6sJzdIj4GQWhVoUq34JljyhA==
X-Received: by 2002:a17:902:ce8a:b0:216:760c:3879 with SMTP id d9443c01a7336-2219ffc00c1mr74674785ad.46.1740180683043;
        Fri, 21 Feb 2025 15:31:23 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2210001ea01sm113953455ad.176.2025.02.21.15.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:31:21 -0800 (PST)
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
Subject: [PATCH v4 0/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB
Date: Fri, 21 Feb 2025 15:31:13 -0800
Message-ID: <20250221233120.3596158-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
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
cros-ec-typec node, not the usb-c-connector node.

The first patch adds the pogo pin binding to describe the detachable
keyboards found on some trogdor devices (actually strongbad). The second
patch is the dts changes required to wire up all the USB stuff. This is
sufficient to set the sysfs properties for USB devices so that the
builtin USB webcam is considered "fixed" or hard-wired while devices
plugged into the connectors or the keyboard are considered "removable"
or hotpluggable.

Changes from v3 https://lore.kernel.org/r/20250210225714.1073618-1-swboyd@chromium.org
 * Consistent quotes in binding
 * Drop unused labels on hub ports

Changes from v2 https://lore.kernel.org/r/20250205233016.1600517-1-swboyd@chromium.org
 * Make binding specific to keyboard and move to usb/
 * Update dts to reflect new compatible string for pogo pin keyboard

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
  dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
  arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors

 .../usb/google,usb-pogo-keyboard.yaml         |  68 +++++++++++
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
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
https://chromeos.dev

