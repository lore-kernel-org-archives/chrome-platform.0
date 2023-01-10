Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA73C2C
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 10:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543ACC433D2;
	Tue, 10 Jan 2023 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673346284;
	bh=dTgPvsgrg4/CD/5ArDil+Tfp0HpNO3onh2BF3ZkA0yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkXylVkIew5hS9NGMeN8q1e/E1K3AL1CHW/aod2KYag4L0tf8zmZTtlLTa24sm8/G
	 pJtFaOCBuJsxdLh1uWoXOS6fjxsk1rEbL88p1B/joz5jWmENpYIuGhaBk9IGIcM4H3
	 cM2jnyRePODHWdG9gLLJLeAeQlNJ5Nd1/tEUpa1XsaEHDjq7Hfu0DaBlPIFxG1LPI+
	 0X2cpHMvAC1tfCBoV1pr0NOxjbpjpIWXPSyiHmGJQMe1UhTJhaD2IeO/Qg9XWj10WH
	 a1zAYhtFpIWZoAYO4KpMB4GSG//9yQPRhx7rqnGnINiMJkswabQcoqMXJ9BEQmWlBN
	 1LbIDXr6nVRXQ==
Date: Tue, 10 Jan 2023 10:24:38 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 2/3] dt-bindings: mfd: Add compatible string for UART
 support
Message-ID: <Y7085l4J0jbrkd6G@google.com>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <Y7WkeCi7/x/t37JM@google.com>
 <Y7YjmtwByTR+8tbZ@google.com>
 <Y7bdmiZ9lqKZXCfq@google.com>
 <Y7buUdgLfnQqnG+x@google.com>
 <Y7b6dC6dDNO2bVjr@google.com>
 <Y7cSKFIakdGKKokE@google.com>
 <CANg-bXDrSJCGk27YKheupm9YND1fSaBaYfQ1Bd-4C-PnH67ioQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANg-bXDrSJCGk27YKheupm9YND1fSaBaYfQ1Bd-4C-PnH67ioQ@mail.gmail.com>

On Mon, 09 Jan 2023, Mark Hasemeyer wrote:

> On Wed, Jan 4, 2023 at 9:08 AM Lee Jones <lee@kernel.org> wrote:
> > I changed the subject line and applied the patch, thanks.
> 
> Hey Lee, a couple comments/questions:
> 1. The subject line of this patch was updated in v11 of the series.
> 2. What tree was the patch applied to? I don't see the changes in linux-next.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Thanks for flagging.  You will do tomorrow.

-- 
Lee Jones [李琼斯]
