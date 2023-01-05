Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2CB2F27
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 15:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6B1C433D2;
	Thu,  5 Jan 2023 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672932949;
	bh=ThmFFaZuCBtx/iElSZZQ9UwcS0gzAPFIR0kFShc3cE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYC0X7VI8uLnqA67MJt7HRmvO5d2u2apyUE+Xl98mvYFlBBc8NiufSlJvgbDg7KAk
	 54dyeLtNK8kkrTFfKr3J/fk0cqxmjm9DcZgCSqIPhjSVUxMamNunLQA6RaVNN+E2QQ
	 toKsIfj0HG8Fbf8fVrLQTvPYLnE94lC3dGMx92YjniNUT84dPgTfAV2cfhipxBioC2
	 Ty8JA2rFW2EoNqSkOa9BDiVBJ2RWHf2KVgcsf/vW8ZK5LuSr3K0la3cKDljfrlN6Qa
	 K57yMP4AI+1thH8bxQ3edJFLKMo36HYq75TDj/STxga2yJcZjieiyPerWsTXndgB96
	 99XxEr8WxleSA==
Date: Thu, 5 Jan 2023 23:35:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mark Hasemeyer <markhas@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
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
Message-ID: <Y7buUdgLfnQqnG+x@google.com>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <Y7WkeCi7/x/t37JM@google.com>
 <Y7YjmtwByTR+8tbZ@google.com>
 <Y7bdmiZ9lqKZXCfq@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7bdmiZ9lqKZXCfq@google.com>

On Thu, Jan 05, 2023 at 02:24:26PM +0000, Lee Jones wrote:
> On Thu, 05 Jan 2023, Tzung-Bi Shih wrote:
> 
> > On Wed, Jan 04, 2023 at 04:08:24PM +0000, Lee Jones wrote:
> > > On Wed, 07 Dec 2022, Mark Hasemeyer wrote:
> > > 
> > > > From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > > > 
> > > > Add a compatible string to support the UART implementation of the cros
> > > > ec interface. The driver does not support the reg and interrupt
> > > > properties, so exempt them from being required for UART compatible nodes.
> > > > 
> > > > Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > > > Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
> > > > Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > ---
> > > > 
> > > > Changes in v10:
> > > > - No change
> > > > 
> > [...]
> > > 
> > > I changed the subject line and applied the patch, thanks.
> > 
> > Pardon me.  I didn't know you would pick the patch so that I have queued it
> > into chrome-platform[1].  Would you like me to drop the commit?
> 
> Yes, please do.

Dropped in chrome-platform.

> You should gain permission from the maintainer before you apply patches.
> 
>   % scripts/get_maintainer.pl -f Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>      Lee Jones <lee@kernel.org> (supporter:MULTIFUNCTION DEVICES (MFD))
>      Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>      Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>      Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)

I see.  I guess for the case, I should get both MFD and DT bindings
maintainers' Acks before applying the patch.
