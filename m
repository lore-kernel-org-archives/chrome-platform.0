Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAC8BE0
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 14:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8B7C433D2;
	Thu,  5 Jan 2023 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672928673;
	bh=+OBsYkn+1kFqvpmNNMYmPkwpjcHgZc/XdBy9tYzmGnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhFOKuJLdai+4RDkr+cnfk5WxhplfJmxdqAKAJcoZ207bnDR+73ybRA15RtqnDcQj
	 YsSgBSXJRRhvVyS4e5ZwCjPjop8hKEkpZ0+IIvV1geelsim+eeFJyIuWkQ+vioBVNs
	 zuXcXoJbX47aPQUOLA85zX+9P9ZkindaAGGDqi/ToFXAVTigyXOa09bQyylYNKzpZU
	 0xkMP9Vqu8Wcb0t6rUJpxWJAUmY2bEo1Y+DvDjcsbUPTaAZBQi8lo+DrkgqLMSVmON
	 4DNb7yuz/DP/wdA9cAaHLtS4oL/+yzFKPTxEGA3YZaxXJJ/m5copkNVf3i4Mqr3IYN
	 gangprpYofjfw==
Date: Thu, 5 Jan 2023 14:24:26 +0000
From: Lee Jones <lee@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
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
Message-ID: <Y7bdmiZ9lqKZXCfq@google.com>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <Y7WkeCi7/x/t37JM@google.com>
 <Y7YjmtwByTR+8tbZ@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7YjmtwByTR+8tbZ@google.com>

On Thu, 05 Jan 2023, Tzung-Bi Shih wrote:

> On Wed, Jan 04, 2023 at 04:08:24PM +0000, Lee Jones wrote:
> > On Wed, 07 Dec 2022, Mark Hasemeyer wrote:
> > 
> > > From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > > 
> > > Add a compatible string to support the UART implementation of the cros
> > > ec interface. The driver does not support the reg and interrupt
> > > properties, so exempt them from being required for UART compatible nodes.
> > > 
> > > Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > > Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
> > > Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > > 
> > > Changes in v10:
> > > - No change
> > > 
> [...]
> > 
> > I changed the subject line and applied the patch, thanks.
> 
> Pardon me.  I didn't know you would pick the patch so that I have queued it
> into chrome-platform[1].  Would you like me to drop the commit?

Yes, please do.

You should gain permission from the maintainer before you apply patches.

  % scripts/get_maintainer.pl -f Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
     Lee Jones <lee@kernel.org> (supporter:MULTIFUNCTION DEVICES (MFD))
     Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
     Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
 
 Why do I get the feeling we've had this conversation before?

-- 
Lee Jones [李琼斯]
