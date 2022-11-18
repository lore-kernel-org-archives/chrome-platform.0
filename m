Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAA120EE
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 05:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DF4C433C1;
	Fri, 18 Nov 2022 05:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668750244;
	bh=26JuICvWqdOYN2lvbjVbjUW2AdARfI5g0RNvblB4jZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKGNpGMGAb0+yRiYMaUC19vV1FAFQ3pR0cN/QQYdry1LPzE0b7yf2yNvNokniOYoC
	 W6izWQbirDEUrmO6BDcBsuhwpcxxkcMfexlDKLV3akFboJMnz840LVlhCAM9V7yA+f
	 IaWM7up5vJPD1qB6iyln+PQ2PX/TizIYviqtyQ75pArhiKOWLqG4x30iXgohTDyF5w
	 jxlymmklX1xuYXUmr1BLphSB/C1txfmC2m2iQ1L8Bh/VxXLPbwFkiQfLWPvNpARPiy
	 9T/HYFHVkajoJoBnaltUDaZv1/qrJ1z1YrtRChOqja8B8ZIE97vf+FkGScdyv3ntiQ
	 9+ubujmrGYYmg==
Date: Fri, 18 Nov 2022 13:44:00 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: Add DT compatible string
 "google,cros_ec_uart"
Message-ID: <Y3cboMlFTRzSJyQ8@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>

On Thu, Nov 17, 2022 at 11:48:47AM -0700, Mark Hasemeyer wrote:
> Add DT compatible string in
> Documentation/devicetree/bindings/mfd/cros_ec.txt

The patch doesn't apply.  Please rebase it.
