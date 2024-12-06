Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F9175BF;
	Fri,  6 Dec 2024 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733454939; cv=none; b=Rdv5sKFWk5QA69fZmD375p/7TjP5RD6XGK9SCsf9cwLo7mMCBDhzCtpteVjfBs0VKSTr9ZLVyTEBtukMP/KSu67Jq8R8OXmq0Xt5JhoJCLzlVmeHQQE4jVdw92BT8o3Hc9Ky6BCqNW7h9zdXxoQUE6oPkqGy1Q4rZdytLDc+Bgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733454939; c=relaxed/simple;
	bh=c0Mesm+3j7sbbxCt6GkL2YPqaVbb1Dh84roeUjk7ymM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RUIPW8FjObZ7/A+ZqyxImjNGZh5SqELNyWM/3MvZ/mlkvyXyG9lMQbDnBizhxabVioPlBIt8aU1AkW6ogCCduuPbAVqhStHMXN384WOAJGQ9bRc1sIuu7KTNLScW8zYlSTGZ4CbtncbzyLY5/BLLjxYF6nC469gVNvPknqP/j5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bre7l5Sw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bre7l5Sw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B488DC4CED1;
	Fri,  6 Dec 2024 03:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733454938;
	bh=c0Mesm+3j7sbbxCt6GkL2YPqaVbb1Dh84roeUjk7ymM=;
	h=From:To:Cc:Subject:Date:From;
	b=bre7l5Sw6r8gBERcKUaPzRfipVFf4rHPhW8fZ35jxG0DV8gk9lRhIyU05t3R0buG8
	 lz1BdQSdh5FdYMkaUv12Qs0yZMqzeoco1QfhuHDVIy8SRVsBH+yKCXJHgv5LVT6u5Y
	 NvOS05Rn8ud+n62dhDlCEIEoNI8gN4Ysyb5FwZn0+NHIi55SO9weOV+gdXnj1QvrSV
	 6Ta51BWPDI9SIcwgqWxD+wC2dqXambUtrjilrIH/Isxz8SGpHp/afOmeLVrCRl7A8t
	 pfRnmSSN44Nv8A+l3CcHPhdAwtxMjODy8sJAjeCd+DG363vZzGTJxwhcNSyDUdbuQM
	 hcKw4+a2Jf4Gw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	bleung@chromium.org,
	groeck@chromium.org,
	tzungbi@kernel.org
Subject: [PATCH 0/2] platform/chrome: Remove cros-kbd-led-backlight
Date: Fri,  6 Dec 2024 03:14:03 +0000
Message-ID: <20241206031405.1711996-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
keyboard-backlight node"), there are no users for using the OF match.
Instead, the device is added via drivers/mfd/cros_ec_dev.c by
970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").

The series removes the OF match and the DT bindings.

Tzung-Bi Shih (2):
  platform/chrome: cros_kbd_led_backlight: Remove OF match
  dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight

 .../chrome/google,cros-kbd-led-backlight.yaml | 36 -----------
 .../bindings/mfd/google,cros-ec.yaml          |  3 -
 .../platform/chrome/cros_kbd_led_backlight.c  | 62 ++++---------------
 3 files changed, 11 insertions(+), 90 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
2.47.0.338.g60cca15819-goog

