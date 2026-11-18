Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992280;
	b=Jd42mMWwSLgLB0pJQpsI+yLm6l8UUlhg/nSkRLPchH9M+qcdX+46LZxMw5rxYFltTaXd
	 j+zR0r2hIOQ+VOAi8p2nydKb0+2ntGuTmjTRapl1wKjmD3HnN/zjqiLRRjswHtc5HdKAm
	 +K2BNAODq1h/5mb1Mj1wIPHxsJ0JlUfsIcINMjOGS9qZb/26gLkDQ0PwNdt3E+WQoFzoO
	 epYfG8Nsxn+ESiFpbX50o5UW0Q3tNHwysnACvqjmdQNTcvCUCT56ZUXWNDQXUEVAsDkTY
	 IYh7TorqJoz7+rXsQ0hm6sL0j4PlEmTXUf29fyB6UkPD1l/zQPpS0QkuBtJGj04Dbtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992280;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Message-Id:Received:
	 X-Mailer:Content-Transfer-Encoding:To:Cc:Mime-Version:X-Original-From:
	 Date:X-Lms-Return-Path:Content-Type;
	bh=yOxzqLseFUYhYdIECMH6Pr89r6ogqLgHYA2LaD6ZQPI=;
	b=v/qP4kH9SJcEH6Qhv7Jzii+ncix572HTunTublr8kJjW4suNiiaGSUJuMAotPRrmGzSK
	 zeXhMozutyv+BAMJ0VwKZ1tPZ7vOuVnxH8O6gvRmFSba76uSuof/y1GNkwLt0E7BktazM
	 ocW6Rgbr4x9pahZ9GqLzzcgnMIvBGUU8WLy39zbVXcCsIQduReJxK6pNKLzOqSX3YySjn
	 HCBjrHsYyp2iJrcFmuY/8lONtJspvBR0/3rxQZfh38edtdfLvDTHpYG2vIDfH2CS7x631
	 UkTERze3fYY8mox/8l4m0fmwos0IyFHyKp/4hpVWITUJNeLSKybmTs3H9jrnxtGanuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=S1bK5FtW;
	arc=none smtp.remote-ip=209.127.231.58
Received: from va-2-58.ptr.blmpb.com (va-2-58.ptr.blmpb.com [209.127.231.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F61606A336
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 08:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F61606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=S1bK5FtW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992272;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yOxzqLseFUYhYdIECMH6Pr89r6ogqLgHYA2LaD6ZQPI=;
 b=S1bK5FtWYNSZHZNX0NmS/qx575+gxqKr0uU0DGZ6KoNSLjWC8AdMWE8i+M6rPVG5OVY2Bg
 woP7owbnzdPKbrNZS1k0pIIYhfMFmaZR0yIdt9QXNJ1bUTTvQ2PXEd1avjQ8KYRW6xqtSt
 fGJKjiKuOcw8rbFd+4bnXMJDTtQa+RRFMT9cty2VFkwYf0AK4u5AoMW5KNd0e++v/TJmJd
 rHBM5Xg1oD1tdN3SpFanaXyF9YhOjhxHv1NlToTGKjesIjFEJk50LtLG9chwM/LDM2DRi3
 0kNVlBv2/SlBhmBr4qFtx0QYDhknD1bWZQEjV8JhRJgn3qGJ6LpSp1Ij6PjS0w==
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 0/9] Add SpacemiT K3 FML13V05 EC keyboard support
Message-Id: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:49 +0800
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:33 +0800
X-Lms-Return-Path: <lba+26afd688e+c7d6b8+lists.linux.dev+yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8

The DeepComputing FML13V05 uses a ChromeOS-compatible embedded controller
connected through the SpacemiT K3 eSPI peripheral channel. Its internal
keyboard is not available on linux-next without the controller and EC
transport support described in this series.

The EC host command registers are exposed through a memory-mapped,
non-linear peripheral window. This interface cannot use the ordinary
cros_ec_spi message transport directly. Add a K3-specific controller and
EC transport, and reuse the existing ChromeOS EC protocol, MFD and
keyboard drivers. Existing EC core, LPC, SPI, protocol and keyboard C
files and the google,cros-ec binding are unchanged.

The series is based on next-20261116. Patches 1-2 document the controller
and EC bindings; patch 3 adds the controller; patches 4-5 enable Chrome
platform support on RISC-V and add the EC transport; patches 6-8 describe
the pins, controller and board keyboard; patch 9 enables the drivers in
riscv defconfig, with the EC transport and keyboard built as modules.

The controller implementation is ported from the SpacemiT vendor BSP
(revision 29b78afb484b, originally authored by goumin
<min.gou@spacemit.com>). Controller programming and recovery remain
separate from the EC client. The EC transport and compatible are scoped
to K3 because the window layout and controller recovery API are specific
to this hardware. Feedback on the transport split and recovery interface
is welcome.

Validation on an FML13V05 with its internal keyboard, 2026-11-18:
- W=1 cross-build of Image, modules and the board DTB completed. No new
  warnings came from the added drivers.
- Both new bindings and their compiled examples passed schema validation;
  the new examples passed strict DT style checks. The new EC, controller
  and keyboard nodes in the board DTB also passed validation.
- Cold boot and module autoload passed all 20 automatic checks.
- 153 read-only EC queries and three EC module unload/reload cycles
  succeeded. EC firmware was FML13V05-V01.06.
- A/B/C/1/2/Enter, all four arrows and Fn+F1/F2/F7/F8 produced the expected
  28 paired press/release events, with no dropped or held keys and no
  new EC/eSPI errors in the kernel log.

The running test kernel was
7.4.0-rc3-next-20261116-fml13v05-k3-espi+.
Booting the test system required a separate K3 PCIe test module and
USB/NVMe DT additions, which are outside this EC series. Suspend/resume,
EC restart fault injection, full-keymap coverage and long-duration
stability were not tested. A previously observed UEFI reset_system()
failure was not addressed or retested by this series.

Checkpatch reports no errors or CHECK findings. Its four new-file
MAINTAINERS reminders were reviewed: the existing SpacemiT N: pattern
and Chrome EC/DT entries already cover the new paths, so no MAINTAINERS
change is included.

OpenAI Codex assisted the port, patch preparation, review analysis and
test tooling. The work was developed through an iterative session to
port the existing DC-linux/BSP support, keep the common EC implementation
unchanged, use K3-specific naming and bindings, and verify the result on
hardware. Human review was completed before submission; the numbered
patches retain the submitter's existing DCO sign-offs.

Wang Yang (9):
  dt-bindings: bus: Add SpacemiT K3 eSPI controller
  dt-bindings: embedded-controller: Add SpacemiT K3 EC window
  bus: Add SpacemiT K3 eSPI controller support
  platform/chrome: Allow ChromeOS platform support on RISC-V
  platform/chrome: Add SpacemiT K3 eSPI EC transport
  riscv: dts: spacemit: Add K3 eSPI pin group
  riscv: dts: spacemit: Describe the K3 eSPI controller
  riscv: dts: spacemit: Enable the FML13V05 EC keyboard
  riscv: defconfig: Enable the FML13V05 EC keyboard modules

 .../bindings/bus/spacemit,k3-espi.yaml        | 146 ++++
 .../spacemit,k3-cros-ec.yaml                  |  58 ++
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 137 +++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  |  24 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  31 +
 arch/riscv/configs/defconfig                  |   5 +
 drivers/bus/Kconfig                           |  10 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/spacemit-k3-espi.c                | 804 ++++++++++++++++++
 drivers/platform/chrome/Kconfig               |  13 +-
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_spacemit_k3.c | 739 ++++++++++++++++
 include/linux/spacemit-k3-espi.h              |  20 +
 13 files changed, 1988 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
 create mode 100644 drivers/bus/spacemit-k3-espi.c
 create mode 100644 drivers/platform/chrome/cros_ec_spacemit_k3.c
 create mode 100644 include/linux/spacemit-k3-espi.h


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0
