import { CloseButton } from "../CloseButton";

import bugImageUrl from "../../assets/bug.svg";
import ideaImageUrl from "../../assets/idea.svg";
import thoughtImageUrl from "../../assets/thought.svg";
import { useState } from "react";
import { FeedbackTypeStep } from "./Steps/FeedbackTypeStep";
import { FeedbackContentStep } from "./Steps/FeedbackContentStep";
import { FeedbackSuccessStep } from "./Steps/FeedbackSuccessStep";

export const feedbackTypes = {
  BUG: {
    title: "Problema",
    placeholder: "Algo não está funcionando bem? Queremos corrigir. "
      + "Conte com detalhes o que está acontecendo...",
    image: {
      source: bugImageUrl,
      alt: "Imagem de um inseto",
    }
  },
  IDEA: {
    title: "Ideia",
    placeholder: "Teve uma ideia de melhoria ou de nova funcionalidade? "
      + "Conta pra gente!",
    image: {
      source: ideaImageUrl,
      alt: "Imagem de uma lâmpada",
    }
  },
  OTHER: {
    title: "Outro",
    placeholder: "Queremos te ouvir. O que você gostaria de nos dizer?",
    image: {
      source: thoughtImageUrl,
      alt: "Imagem de um balão de pensamento",
    }
  },
}

export type FeedbackType = keyof typeof feedbackTypes;

export function WidgetForm() {
  const [feedbackType, setFeedbackType] = useState<FeedbackType | null>(null)
  const [feedbackSent, setFeedbackSent] = useState(false)
  function handleRestartFeedback() {
    setFeedbackSent(false)
    setFeedbackType(null)
  }
  return (
    <div className="bg-zinc-900 p-4 relative rounded-2xl mb-4 flex flex-col items-center shadow-lg w-[calc(100vw-2rem)] md:w-auto">
      {feedbackSent ? (<FeedbackSuccessStep onFeedbackRestartRequested={handleRestartFeedback} />) :
        <>
          {!feedbackType ? <FeedbackTypeStep onFeedbackTypeChanged={setFeedbackType} /> :
            (<FeedbackContentStep
              feedbackType={feedbackType}
              onFeedbackRestartRequested={handleRestartFeedback}
              onFeedbackSent={() => setFeedbackSent(true)}
            />)}
        </>}
      <footer>
        Feito com ♥ por <a href="" className="underline-offset-2 underline">Rodrigo</a>
      </footer>
    </div>
  );
}